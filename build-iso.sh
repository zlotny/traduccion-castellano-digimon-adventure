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
echo "==> Construyendo ISO + xdelta..."
python digimon_toolkit/cli.py apply
