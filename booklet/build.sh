#!/usr/bin/env bash
#
# booklet/build.sh
# Build the print booklet for a Burners book: cover, title page, contents,
# two-column pages with engravings, back cover. Same look as the Wåndyr
# booklet, built from the markdown instead of laid out by hand.
#
#   booklet/build.sh                     the core rules (burners-adventure-game)
#   booklet/build.sh burners-sorcerie    any other book in markdown/
#
# Reads    markdown/<book>.md
#          booklet/<book>.json           optional recipe: titles, art, back cover
#                                        (fields are listed at the top of booklet.lua)
# Writes   pdf/<Book Title>.pdf         the book's file name in title case, with
#                                        spaces for dashes: "Burners Adventure Game.pdf"
#                                        (the plain PDF from pdf-deploy.sh sits beside
#                                        it as burners-adventure-game.pdf)
#
# The page count is padded with Notes pages to a multiple of four, so the PDF
# can be printed as a folded booklet with the back cover on the outside.
#
# Layout lives in booklet.css, page structure in template.html, and the
# markdown-to-pages rules in booklet.lua. Needs pandoc and weasyprint, the same
# tools pdf-deploy.sh uses, and pdfinfo (from poppler) to count the pages.
# Nothing here is run by pdf-deploy.sh or CI.

set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$HERE/.." && pwd)"

BOOK="$(basename "${1:-burners-adventure-game}" .md)"
SRC="$ROOT/markdown/$BOOK.md"

# burners-arms-and-armor -> "Burners Arms and Armor"
TITLE="$(printf '%s' "$BOOK" | awk -F- '{
  for (i = 1; i <= NF; i++) {
    w = $i
    if (w == "ose") w = "OSE"
    else if (i == 1 || w !~ /^(a|an|and|in|of|on|or|the|to)$/) w = toupper(substr(w, 1, 1)) substr(w, 2)
    printf "%s%s", (i > 1 ? " " : ""), w
  }
}')"
OUT="$ROOT/pdf/$TITLE.pdf"

# Must match MARKDOWN in booklet.lua. commonmark_x reads the files the way
# Obsidian does; the wikilinks extension turns [[Page#Section]] into links.
FORMAT="commonmark_x+wikilinks_title_after_pipe-tex_math_dollars"

if [[ ! -f "$SRC" ]]; then
  echo "error: no such book: $SRC" >&2
  exit 1
fi
for tool in pandoc weasyprint pdfinfo; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "error: $tool not found on PATH (brew install pandoc weasyprint poppler)" >&2
    exit 1
  fi
done

# The date on the title page is when the book's markdown last changed.
DATE="$(date -r "$SRC" '+%b %-d, %Y')"

TMP="$(mktemp -d "${TMPDIR:-/tmp}/burners-booklet.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

# render <notes pages> <output pdf>
render() {
  pandoc "$SRC" \
    --from "$FORMAT" --to html5 --standalone \
    --template "$HERE/template.html" \
    --lua-filter "$HERE/booklet.lua" \
    --metadata "booklet-date=$DATE" \
    --metadata "booklet-pad=$1" \
    | weasyprint --base-url "$ROOT/" - "$2"
}

page_count() {
  pdfinfo "$1" | awk '/^Pages:/ { print $2 }'
}

echo "building: $BOOK"
render 0 "$TMP/book.pdf"
pages="$(page_count "$TMP/book.pdf")"

pad=$(( (4 - pages % 4) % 4 ))
if (( pad > 0 )); then
  # The second pass repeats the first pass's warnings; show them only if it fails.
  if ! render "$pad" "$TMP/book.pdf" 2>"$TMP/second-pass.log"; then
    cat "$TMP/second-pass.log" >&2
    exit 1
  fi
  pages="$(page_count "$TMP/book.pdf")"
fi

if (( pages % 4 != 0 )); then
  echo "warning: $pages pages is not a multiple of four; it will not fold cleanly" >&2
fi

mkdir -p "$ROOT/pdf"
mv "$TMP/book.pdf" "$OUT"
echo "done: $pages pages ($(( pages / 4 )) sheets, $pad notes) -> $OUT"
