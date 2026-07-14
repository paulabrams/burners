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
else
  SOURCE_DIR="$(/usr/bin/python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["source_dir"])' "$CONFIG")"
  DEST_DIR="$(/usr/bin/python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["dest_dir"])' "$CONFIG")"
  COPY_TO_RAW="$(/usr/bin/python3 -c 'import json,sys; print("\n".join(json.load(open(sys.argv[1])).get("copy_to", [])))' "$CONFIG")"
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

# Recurse so this works whether the source is flat or organized into
# subdirectories. All PDFs land flat in DEST_DIR, keyed by the file's basename.
while IFS= read -r -d '' md; do
  base="$(basename "$md" .md)"
  pdf="$DEST_DIR/$base.pdf"

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
done < <(find "$SOURCE_DIR" -type f -name '*.md' -print0)

echo "done: $converted converted, $skipped up-to-date, $failed failed -> $DEST_DIR"
if [[ ${#COPY_TO[@]} -gt 0 ]]; then
  printf 'also mirrored to: %s\n' "${COPY_TO[@]}"
fi

# Optional zips (CI sets PDF_DEPLOY_ZIP_DIR=_site/downloads).
ZIP_DIR="${PDF_DEPLOY_ZIP_DIR:-}"
if [[ -n "$ZIP_DIR" ]]; then
  mkdir -p "$ZIP_DIR"
  ZIP_DIR_ABS="$(cd "$ZIP_DIR" && pwd)"
  PDF_ZIP="$ZIP_DIR_ABS/burners-pdfs.zip"
  MD_ZIP="$ZIP_DIR_ABS/burners-markdown.zip"
  rm -f "$PDF_ZIP" "$MD_ZIP"
  (cd "$DEST_DIR" && zip -q "$PDF_ZIP" ./*.pdf)
  (cd "$SOURCE_DIR" && zip -q "$MD_ZIP" ./*.md)
  echo "zips: $PDF_ZIP , $MD_ZIP"
fi
