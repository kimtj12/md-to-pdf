#!/bin/bash
# Usage: md2pdf.sh file.md [file2.md ...]  → 같은 폴더에 file.pdf 생성
set -euo pipefail
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
DIR="$(cd "$(dirname "$0")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

for MD in "$@"; do
  SRC="$(cd "$(dirname "$MD")" && pwd)"
  NAME="$(basename "${MD%.*}")"
  TMP="$(mktemp -d)"
  pandoc "$MD" -f gfm -t html5 -s --embed-resources \
    --resource-path="$SRC:$DIR" --css="$DIR/style.css" \
    --syntax-highlighting=pygments \
    --lua-filter="$DIR/mermaid.lua" --include-in-header="$DIR/mermaid-header.html" \
    --metadata pagetitle="$NAME" -o "$TMP/out.html"
  "$CHROME" --headless --disable-gpu --no-pdf-header-footer --virtual-time-budget=10000 \
    --print-to-pdf="$SRC/$NAME.pdf" "file://$TMP/out.html" 2>/dev/null
  rm -rf "$TMP"
done
