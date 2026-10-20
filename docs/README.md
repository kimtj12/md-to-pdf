# md-to-pdf

macOS에서 Markdown 파일을 깔끔한 A4 PDF로 변환한다. Finder 우클릭 한 번으로 실행된다.

예시 결과물: [`example/example.pdf`](../example/example.pdf) (원본 [`example/example.md`](../example/example.md))

## 특징

- Pretendard 본문, 한글 어절 단위 줄바꿈, 쪽번호(`1 / 10`)
- 코드 블록 문법 색상, 코드 블록 안 한글 정렬(D2Coding)
- 표 머리글 페이지마다 반복, 행 중간에서 잘리지 않음
- Mermaid 다이어그램 렌더링 (오프라인)

## 설치 / 사용

[INSTALL.md](INSTALL.md) 참고. 요약:

```bash
git clone https://github.com/kimtj12/md-to-pdf.git ~/md-to-pdf
cd ~/md-to-pdf && ./install.sh
```

이후 Finder에서 `.md` 우클릭 → **빠른 동작 → PDF로 내보내기**.

## 구조

| 파일 | 역할 |
|---|---|
| `md2pdf.sh` | 변환 스크립트 (Pandoc → HTML → headless Chrome → PDF) |
| `style.css` | PDF 디자인 전부. 디자인 수정은 이 파일만 고치면 됨 |
| `mermaid.lua`, `mermaid-header.html` | ` ```mermaid ` 블록을 다이어그램으로 변환 |
| `vendor/mermaid.min.js` | Mermaid 11.4.1 (MIT) |
| `PDF로 내보내기.workflow` | Finder Quick Action 원본 (`install.sh`가 경로를 채워 설치) |
| `install.sh` | 의존성 설치 + Quick Action 등록 |

## 참고

- Mermaid 다이어그램은 페이지 폭과 높이(110mm)에 맞춰 축소되므로, 너무 넓거나 긴 그래프는 글씨가 작아진다.
