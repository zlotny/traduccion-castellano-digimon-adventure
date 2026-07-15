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
# Boundaries verified against actual dialog content (not just file-ID guessing)
# in 2026-07: Devimon's defeat + Gennai's "go to Server Continent" epilogue is
# the tail of 3541; Etemon dies in 3547; VenomVamdemon falls in 3571; the four
# Dark Masters fall across 3572-3584 with two non-contiguous memorial scenes
# at 3611-3614; Apocalymon + the series finale are 3585-3586. Past that, the
# file range is NOT one bucket: 3587-3589 is the "Our War Game!" movie (not a
# TV episode), 3590-3610 is unrelated side-quests/minigames, and 3615-3622 is
# a bonus dungeon cameo-ing heroes from later Digimon series.
ARC_RANGES = [
    (range(3520, 3542), "Arco Devimon (Eps 1–13)"),
    (range(3542, 3548), "Arco Etemon (Eps 14–20)"),
    (range(3548, 3572), "Arco Myotismon (Eps 21–39)"),
    (range(3572, 3585), "Arco Dark Masters (Eps 40–52)"),
    (range(3585, 3587), "Arco Apocalymon (Eps 53–54)"),
    (range(3587, 3590), "Película: Our War Game!"),
    (range(3590, 3611), "Escenas originales / minijuegos"),
    (range(3611, 3615), "Arco Dark Masters (Eps 40–52)"),
    (range(3615, 3623), "Dungeon crossover (otras series Digimon)"),
    (range(3623, 9999), "Escenas originales / minijuegos"),
]

# Some labels above cover more than one non-contiguous range (Dark Masters,
# Escenas originales) — dedupe by first appearance so the per-arc table
# doesn't print the same row twice while still summing every matching range.
ARC_LABELS = list(dict.fromkeys(label for _, label in ARC_RANGES))

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
for arc_label in ARC_LABELS:
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
