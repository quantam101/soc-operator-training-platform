#!/usr/bin/env bash
set -euo pipefail
info(){ printf "[INFO] %s\n" "$*"; }
die(){ printf "[ERROR] %s\n" "$*" >&2; exit 1; }

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$ROOT_DIR"

echo "=== Tier-3+ Gate Verification ==="
echo ""

# Check for quarter constraint
QC="$ROOT_DIR/docs/TIER3_QUARTER_CONSTRAINT.txt"
if [ -f "$QC" ]; then
  echo "✓ Quarter constraint file exists: $QC"
  echo "  Current constraint: $(cat "$QC")"
else
  echo "! Quarter constraint file not found (will be created on first doctrine promotion)"
  echo "  Expected: $QC"
fi
echo ""

# Check for gates file
GATES="$ROOT_DIR/docs/TIER3_GATES.md"
if [ -f "$GATES" ]; then
  echo "✓ Gates file exists: $GATES"
  COUNT="$(grep -cE '^##' "$GATES" 2>/dev/null || echo 0)"
  echo "  Gates promoted: $COUNT"
else
  echo "! Gates file not found (will be created on first doctrine promotion)"
  echo "  Expected: $GATES"
fi
echo ""

# Check for philosophy
PH="$ROOT_DIR/core/content/interviews/soc_tier3_pack/philosophy/tier3_evaluation_philosophy.md"
if [ -f "$PH" ]; then
  echo "✓ Philosophy document exists"
else
  echo "✗ Missing: $PH"
fi

# Check for memo template
TMPL="$ROOT_DIR/core/content/interviews/soc_tier3_pack/artifacts/templates/analyst_memo_tier3plus.md"
if [ -f "$TMPL" ]; then
  echo "✓ Memo template exists"
else
  echo "! Memo template not found"
  echo "  Expected: $TMPL"
  echo "  Run: bash scripts/ONE_SCRIPT_ALL.sh to generate"
fi
echo ""

# Check for scenarios
SCENARIOS="$ROOT_DIR/core/content/interviews/soc_tier3_pack/scenarios"
if [ -d "$SCENARIOS" ]; then
  SCOUNT="$(find "$SCENARIOS" -name "*.yml" 2>/dev/null | wc -l | tr -d ' ')"
  echo "✓ Scenarios directory exists"
  echo "  Scenarios found: $SCOUNT"
  echo ""
  echo "  Scenarios:"
  find "$SCENARIOS" -name "*.yml" -exec basename {} \; 2>/dev/null | sed 's/^/    - /'
else
  echo "✗ Missing scenarios directory: $SCENARIOS"
fi
echo ""

echo "=== Verification Complete ==="
