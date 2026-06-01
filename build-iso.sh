#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [ -f "$ROOT/.venv/bin/activate" ]; then
    source "$ROOT/.venv/bin/activate"
fi

echo "==> Importando CSV → JSON..."
python digimon_toolkit/cli.py from-csv

echo ""
echo "==> Importando atlas de fuente (translations/font_atlas.png)..."
python digimon_toolkit/font_tool.py import-atlas

echo ""
echo "==> Construyendo ISO + xdelta..."
python digimon_toolkit/cli.py apply
