# 다른 Mac에 설치하기

## 준비물

- macOS
- [Homebrew](https://brew.sh) — 없으면 먼저 설치

나머지(pandoc, Google Chrome, 폰트)는 설치 스크립트가 없을 때만 Homebrew로 설치한다.

## 설치

```bash
git clone https://github.com/kimtj12/md-to-pdf.git ~/md-to-pdf
cd ~/md-to-pdf
./install.sh
```

1. 원하는 위치에 저장소를 clone (위 예시는 `~/md-to-pdf`)
2. `./install.sh` 실행
3. `killall Finder` 로 Finder 재시작

`install.sh`가 하는 일:

| 단계 | 내용 |
|---|---|
| 의존성 확인 | `pandoc`, Google Chrome이 없으면 설치 |
| 폰트 확인 | Pretendard, JetBrains Mono, D2Coding이 없으면 설치 |
| Quick Action 등록 | `~/Library/Services/PDF로 내보내기.workflow`에 복사하고, 현재 폴더 경로를 넣음 |

## 사용

- **Finder:** `.md` 파일 우클릭 → **빠른 동작** → **PDF로 내보내기**
  - 같은 폴더에 같은 이름의 `.pdf`가 생기고, 끝나면 효과음이 난다
- **터미널:** `./md2pdf.sh 파일.md [파일2.md ...]`

## 메뉴가 안 보일 때

1. `killall Finder` 실행
2. **시스템 설정 → 키보드 → 키보드 단축키 → 서비스 → 파일 및 폴더**에서 "PDF로 내보내기" 켜기

## 업데이트 / 폴더 이동

- 업데이트: `git pull` (Quick Action은 이 폴더의 `md2pdf.sh`를 직접 호출하므로 재설치 불필요)
- 폴더를 다른 위치로 옮겼다면 `./install.sh`를 다시 실행

## 제거

```bash
rm -rf ~/Library/Services/PDF로\ 내보내기.workflow
```
