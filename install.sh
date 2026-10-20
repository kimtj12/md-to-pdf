#!/bin/bash
# 새 Mac에 설치: 이 폴더를 원하는 위치에 둔 뒤 ./install.sh 실행
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
NAME="PDF로 내보내기.workflow"
DEST="$HOME/Library/Services/$NAME"

command -v brew >/dev/null || { echo "Homebrew가 필요합니다: https://brew.sh"; exit 1; }
[ -d "/Applications/Google Chrome.app" ] || brew install --cask google-chrome
command -v pandoc >/dev/null || brew install pandoc
# 이미 수동 설치된 폰트가 있으면 brew가 충돌하므로 파일 이름으로 먼저 확인
for pair in Pretendard:font-pretendard JetBrainsMono:font-jetbrains-mono D2Coding:font-d2coding; do
  ls ~/Library/Fonts /Library/Fonts 2>/dev/null | grep -q "^${pair%%:*}" || brew install --cask "${pair#*:}"
done

mkdir -p "$HOME/Library/Services"
rm -rf "$DEST"
cp -R "$DIR/$NAME" "$DEST"
sed -i '' "s#__DIR__#$DIR#" "$DEST/Contents/document.wflow"
chmod +x "$DIR/md2pdf.sh"
/System/Library/CoreServices/pbs -flush
echo "설치 완료. Finder에서 .md 우클릭 → 빠른 동작 → PDF로 내보내기"
