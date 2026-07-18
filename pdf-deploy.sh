#!/usr/bin/env bash
#
# pdf-deploy.sh
# Convert markdown files from a source dir to PDF and write them into a
# destination dir. Paths come from pdf-deploy-config.json (same dir as this
# script), so nothing is hardcoded.
#
# Only converts a file when its PDF is missing or the .md is newer than the
# existing PDF, so re-runs are cheap.
#
# Optional: set PDF_DEPLOY_ZIP_DIR to also write burners-pdfs.zip and
# burners-markdown.zip there (CI uses _site/downloads on push to main).
# Local push: optional .githooks/pre-push runs this when markdown changes
# (enable with: git config core.hooksPath .githooks).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$SCRIPT_DIR/pdf-deploy-config.json"

if [[ ! -f "$CONFIG" ]]; then
  echo "error: config not found: $CONFIG" >&2
  exit 1
fi

# Read config. Prefer jq; fall back to a small python parser if jq is absent.
# COPY_TO_RAW is a newline-separated list of extra directories.
if command -v jq >/dev/null 2>&1; then
  SOURCE_DIR="$(jq -r '.source_dir' "$CONFIG")"
  DEST_DIR="$(jq -r '.dest_dir' "$CONFIG")"
  COPY_TO_RAW="$(jq -r '.copy_to // [] | .[]' "$CONFIG")"
  EXTRA_SOURCE_RAW="$(jq -r '.extra_source_dirs // [] | .[]' "$CONFIG")"
  EXTRA_DEST_DIR="$(jq -r '.extra_dest_dir // ""' "$CONFIG")"
else
  SOURCE_DIR="$(/usr/bin/python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["source_dir"])' "$CONFIG")"
  DEST_DIR="$(/usr/bin/python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["dest_dir"])' "$CONFIG")"
  COPY_TO_RAW="$(/usr/bin/python3 -c 'import json,sys; print("\n".join(json.load(open(sys.argv[1])).get("copy_to", [])))' "$CONFIG")"
  EXTRA_SOURCE_RAW="$(/usr/bin/python3 -c 'import json,sys; print("\n".join(json.load(open(sys.argv[1])).get("extra_source_dirs", [])))' "$CONFIG")"
  EXTRA_DEST_DIR="$(/usr/bin/python3 -c 'import json,sys; print(json.load(open(sys.argv[1])).get("extra_dest_dir", ""))' "$CONFIG")"
fi

# Allow env vars to override the config paths. This lets CI point the source at
# the checked-out repo and the destination into the Jekyll _site output, while
# local runs keep using the absolute paths in the config file.
SOURCE_DIR="${PDF_DEPLOY_SOURCE_DIR:-$SOURCE_DIR}"
DEST_DIR="${PDF_DEPLOY_DEST_DIR:-$DEST_DIR}"

# PDF_DEPLOY_COPY_TO overrides the copy_to list when set (even to empty, which
# disables extra copies — used by CI, where the Supernote dir does not exist).
if [[ "${PDF_DEPLOY_COPY_TO+set}" == "set" ]]; then
  COPY_TO_RAW="$PDF_DEPLOY_COPY_TO"
fi

# Split the newline-separated copy targets into an array.
COPY_TO=()
while IFS= read -r line; do
  [[ -n "$line" ]] && COPY_TO+=("$line")
done <<< "$COPY_TO_RAW"

# extra_source_dirs are draft/experimental trees that sit parallel to the main
# markdown source. Their PDFs are built and mirrored to the copy_to targets (the
# Supernote) but are deliberately kept out of the site zips. CI sets
# PDF_DEPLOY_SKIP_EXTRA=1 so experiments never reach the published site.
EXTRA_SOURCE_DIRS=()
while IFS= read -r line; do
  [[ -n "$line" ]] && EXTRA_SOURCE_DIRS+=("$line")
done <<< "$EXTRA_SOURCE_RAW"

if [[ -z "$SOURCE_DIR" || -z "$DEST_DIR" ]]; then
  echo "error: source_dir and dest_dir must both be set in $CONFIG" >&2
  exit 1
fi

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "error: source_dir does not exist: $SOURCE_DIR" >&2
  exit 1
fi

mkdir -p "$DEST_DIR"
for target in "${COPY_TO[@]}"; do
  mkdir -p "$target"
done

if ! command -v pandoc >/dev/null 2>&1; then
  echo "error: pandoc not found on PATH" >&2
  exit 1
fi

converted=0
skipped=0
failed=0

# Convert every markdown file under a source dir into PDFs in a dest dir, then
# mirror each PDF to the copy_to targets. Recurse so this works whether the
# source is flat or organized into subdirectories; all PDFs land flat in the
# dest dir, keyed by the file's basename.
convert_tree() {
  local src="$1" dst="$2"
  mkdir -p "$dst"
  while IFS= read -r -d '' md; do
    local base pdf
    base="$(basename "$md" .md)"
    pdf="$dst/$base.pdf"

    # Convert only if the PDF is missing or the markdown is newer.
    if [[ -f "$pdf" && "$pdf" -nt "$md" ]]; then
      skipped=$((skipped + 1))
    else
      echo "converting: $base"
      if pandoc "$md" \
          --pdf-engine=weasyprint \
          -M title="" \
          -V maxwidth=none \
          -V margin-left=0 -V margin-right=0 -V margin-top=0 -V margin-bottom=0 \
          -V header-includes='<style>@page { margin: 1.2cm; }</style>' \
          -o "$pdf"; then
        converted=$((converted + 1))
      else
        echo "warning: failed to convert $md" >&2
        failed=$((failed + 1))
        continue
      fi
    fi

    # Mirror the PDF to any extra targets, copying only when out of date.
    for target in "${COPY_TO[@]}"; do
      if [[ ! -f "$target/$base.pdf" || "$pdf" -nt "$target/$base.pdf" ]]; then
        cp "$pdf" "$target/$base.pdf"
      fi
    done
  done < <(find "$src" -type f -name '*.md' -print0)
}

convert_tree "$SOURCE_DIR" "$DEST_DIR"

# Build the parallel draft/experimental trees too, unless CI has disabled them.
# These share the copy_to (Supernote) but never feed the site zips below.
if [[ -z "${PDF_DEPLOY_SKIP_EXTRA:-}" && ${#EXTRA_SOURCE_DIRS[@]} -gt 0 && -n "$EXTRA_DEST_DIR" ]]; then
  for extra_src in "${EXTRA_SOURCE_DIRS[@]}"; do
    if [[ -d "$extra_src" ]]; then
      convert_tree "$extra_src" "$EXTRA_DEST_DIR"
    else
      echo "warning: extra source_dir does not exist, skipping: $extra_src" >&2
    fi
  done
fi

echo "done: $converted converted, $skipped up-to-date, $failed failed -> $DEST_DIR"
if [[ ${#COPY_TO[@]} -gt 0 ]]; then
  printf 'also mirrored to: %s\n' "${COPY_TO[@]}"
fi

# Optional zips. Always refresh repo downloads/ for the site; CI may also set
# PDF_DEPLOY_ZIP_DIR=_site/downloads so the built artifact has fresh zips.
# zip -X omits Unix UT extras (access time) so recreating an unchanged tree
# does not dirt git. Compare by member CRC+size+name, not raw bytes of old zips.
zip_payload_fp() {
  /usr/bin/python3 - "$1" <<'PY'
import sys, zipfile
z = zipfile.ZipFile(sys.argv[1])
for i in sorted(z.infolist(), key=lambda x: x.filename):
    print(f"{i.filename}\t{i.CRC:08x}\t{i.file_size}")
PY
}

write_zips() {
  local out="$1"
  [[ -z "$out" ]] && return 0
  mkdir -p "$out"
  local out_abs tmp pdf_zip md_zip
  out_abs="$(cd "$out" && pwd)"
  tmp="$(mktemp -d)"
  pdf_zip="$out_abs/burners-pdfs.zip"
  md_zip="$out_abs/burners-markdown.zip"
  (cd "$DEST_DIR" && zip -q -X "$tmp/burners-pdfs.zip" ./*.pdf)
  (cd "$SOURCE_DIR" && zip -q -X "$tmp/burners-markdown.zip" ./*.md)
  for pair in "burners-pdfs.zip:$pdf_zip" "burners-markdown.zip:$md_zip"; do
    local name="${pair%%:*}" dest="${pair#*:}"
    if [[ -f "$dest" ]] && cmp -s <(zip_payload_fp "$tmp/$name") <(zip_payload_fp "$dest"); then
      echo "zip up-to-date: $dest"
    else
      mv "$tmp/$name" "$dest"
      echo "zip updated: $dest"
    fi
  done
  rm -rf "$tmp"
}

write_zips "$SCRIPT_DIR/downloads"
if [[ -n "${PDF_DEPLOY_ZIP_DIR:-}" ]]; then
  zip_dir_abs="$(cd "$PDF_DEPLOY_ZIP_DIR" && pwd)"
  downloads_abs="$(cd "$SCRIPT_DIR/downloads" && pwd)"
  if [[ "$zip_dir_abs" != "$downloads_abs" ]]; then
    write_zips "$PDF_DEPLOY_ZIP_DIR"
  fi
fi
