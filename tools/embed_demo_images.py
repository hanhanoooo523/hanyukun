"""Inline demo-screenshots/*.png into StyleShift-设计演示.html as data URIs."""
import base64
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HTML = next(ROOT.glob("StyleShift-*设计演示.html"))
DS = ROOT / "demo-screenshots"


def main() -> None:
    html = HTML.read_text(encoding="utf-8")
    for png in sorted(DS.glob("*.png")):
        old = f'src="demo-screenshots/{png.name}"'
        if old not in html:
            print("skip", png.name)
            continue
        b64 = base64.b64encode(png.read_bytes()).decode("ascii")
        html = html.replace(old, f'src="data:image/png;base64,{b64}"')
        print("embedded", png.name)
    HTML.write_text(html, encoding="utf-8")
    print("done", HTML.name, "total_chars", len(html))


if __name__ == "__main__":
    main()
