#!/usr/bin/env bash
set -euo pipefail

# Query the web UI API and print a Markdown progress table.
# The translation server must be running (serve.sh).
#
# Usage:
#   ./progress.sh            # print to stdout
#   ./progress.sh --update   # also patch the table block in README.md

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UPDATE_README=0
[[ "${1:-}" == "--update" ]] && UPDATE_README=1

python3 - "$ROOT" "$UPDATE_README" <<'PYEOF'
import sys, json, urllib.request, textwrap
from pathlib import Path

ROOT        = Path(sys.argv[1])
UPDATE      = sys.argv[2] == "1"
API         = "http://localhost:5174/api/files"

# ── fetch data ─────────────────────────────────────────────────────────────
try:
    with urllib.request.urlopen(API, timeout=3) as r:
        data = json.loads(r.read())
except Exception as exc:
    sys.exit(f"Error: no se pudo conectar a {API}\n"
             f"  ¿Está arrancado el servidor? Ejecuta ./serve.sh\n  ({exc})")

# ── arc labels ─────────────────────────────────────────────────────────────
ARC_RANGES = [
    (range(3520, 3534), "Arco Devimon (Eps 1–13)"),
    (range(3534, 3541), "Arco Etemon (Eps 14–20)"),
    (range(3541, 3562), "Arco Myotismon (Eps 21–39)"),
    (range(3562, 3575), "Arco Dark Masters (Eps 40–52)"),
    (range(3575, 3581), "Arco Apocalymon (Eps 53–54)"),
    (range(3581, 9999), "Escenas originales / batallas"),
]

def arc_for(file_id: str) -> str:
    try:
        n = int(file_id)
    except ValueError:
        return "Otros"
    for rng, label in ARC_RANGES:
        if n in rng:
            return label
    return "Otros"

# ── aggregate by arc ────────────────────────────────────────────────────────
arc_totals: dict[str, dict] = {}
for entry in data.get("dialog", []):
    arc = arc_for(entry["id"])
    acc = arc_totals.setdefault(arc, {"done": 0, "total": 0})
    acc["done"]  += entry["done"]
    acc["total"] += entry["total"]

# ── summary counts ──────────────────────────────────────────────────────────
def cat_sum(entries):
    d = sum(e["done"] for e in entries)
    t = sum(e["total"] for e in entries)
    return d, t

dlg_d, dlg_t   = cat_sum(data.get("dialog", []))
eb_d,  eb_t    = cat_sum(data.get("eboot", []))
nm_d,  nm_t    = cat_sum(data.get("names", []))
oth_d, oth_t   = cat_sum(data.get("other", []))
tot_d = dlg_d + eb_d + nm_d + oth_d
tot_t = dlg_t + eb_t + nm_t + oth_t

def pct(d, t):
    return f"{round(100*d/t, 1)}%" if t else "—"

def bar(d, t, width=20):
    if not t:
        return "░" * width
    filled = round(width * d / t)
    return "█" * filled + "░" * (width - filled)

# ── build markdown ──────────────────────────────────────────────────────────
lines = []
lines.append(f"**Progreso total:** `{bar(tot_d, tot_t, 30)}` **{pct(tot_d, tot_t)}** ({tot_d}/{tot_t} líneas)")
lines.append("")
lines.append("### Resumen")
lines.append("")
lines.append("| Categoría | Líneas | Progreso |")
lines.append("|-----------|-------:|----------|")
lines.append(f"| Diálogos  | {dlg_d}/{dlg_t} | `{bar(dlg_d, dlg_t, 15)}` {pct(dlg_d, dlg_t)} |")
lines.append(f"| EBOOT     | {eb_d}/{eb_t}   | `{bar(eb_d, eb_t, 15)}` {pct(eb_d, eb_t)} |")
lines.append(f"| Nombres   | {nm_d}/{nm_t}   | `{bar(nm_d, nm_t, 15)}` {pct(nm_d, nm_t)} |")
lines.append(f"| UI / otros | {oth_d}/{oth_t} | `{bar(oth_d, oth_t, 15)}` {pct(oth_d, oth_t)} |")
lines.append(f"| **Total** | **{tot_d}/{tot_t}** | `{bar(tot_d, tot_t, 15)}` **{pct(tot_d, tot_t)}** |")
lines.append("")
lines.append("### Progreso por arco")
lines.append("")
lines.append("| Arco | Líneas | Progreso |")
lines.append("|------|-------:|----------|")
for _, arc_label in ARC_RANGES:
    acc = arc_totals.get(arc_label, {"done": 0, "total": 0})
    d, t = acc["done"], acc["total"]
    lines.append(f"| {arc_label} | {d}/{t} | `{bar(d, t, 15)}` {pct(d, t)} |")

table_md = "\n".join(lines)

print(table_md)

# ── optionally update README.md ─────────────────────────────────────────────
if UPDATE:
    readme = ROOT / "translations" / "README.md"
    if not readme.exists():
        readme = ROOT / "README.md"

    MARKER_START = "<!-- progress-start -->"
    MARKER_END   = "<!-- progress-end -->"

    text = readme.read_text(encoding="utf-8")
    block = f"{MARKER_START}\n{table_md}\n{MARKER_END}"

    if MARKER_START in text:
        import re
        text = re.sub(
            re.escape(MARKER_START) + r".*?" + re.escape(MARKER_END),
            block,
            text,
            flags=re.DOTALL,
        )
        print(f"\n✓ README actualizado: {readme}")
    else:
        print(f"\n⚠  No se encontraron las marcas {MARKER_START} / {MARKER_END} en {readme}")
        print("   Añádelas manualmente donde quieras la tabla.")

    readme.write_text(text, encoding="utf-8")
PYEOF
