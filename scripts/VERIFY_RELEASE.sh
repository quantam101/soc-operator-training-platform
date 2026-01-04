#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

echo "=== SOC Operator Training Platform - Release Verification ==="
echo ""

# Count files
SCRIPTS_COUNT="$(find scripts -name "*.sh" -type f 2>/dev/null | wc -l | tr -d ' ')"
OPERATOR_SCRIPTS="$(find scripts/operator_loop -name "*.sh" -type f 2>/dev/null | wc -l | tr -d ' ')"
SCENARIOS="$(find core/content/interviews/soc_tier3_pack/scenarios -name "*.yml" 2>/dev/null | wc -l | tr -d ' ')"

echo "Scripts:"
echo "  Total scripts: $SCRIPTS_COUNT"
echo "  Operator loop scripts: $OPERATOR_SCRIPTS"
echo ""

echo "Content:"
echo "  Tier-3+ scenarios: $SCENARIOS"
echo ""

# Check key files
check_file(){
  local path="$1"
  local label="$2"
  if [ -f "$path" ]; then
    echo "  ✓ $label"
  else
    echo "  ✗ $label (missing: $path)"
  fi
}

echo "Core files:"
check_file "README.md" "README"
check_file "LICENSE" "LICENSE"
check_file "scripts/ONE_SCRIPT_ALL.sh" "Master script"
echo ""

echo "Documentation:"
check_file "docs/GETTING_STARTED.md" "Getting Started"
check_file "docs/TIER3_PLUS_PHASES.md" "4-Phase Documentation"
echo ""

echo "Tier-3+ content:"
check_file "core/content/interviews/soc_tier3_pack/scenarios/momentum_bias_trust_break.yml" "Scenario 1: Momentum Bias"
check_file "core/content/interviews/soc_tier3_pack/scenarios/regulator_board_collision.yml" "Scenario 2: Regulator Board"
check_file "core/content/interviews/soc_tier3_pack/scenarios/insider_threat_false_positive.yml" "Scenario 3: Insider Threat"
check_file "core/content/interviews/soc_tier3_pack/scenarios/audit_timebomb_migration.yml" "Scenario 4: Audit Timebomb"
echo ""

echo "=== Verification Complete ==="
echo ""

if [ "$SCENARIOS" -eq 4 ]; then
  echo "✓ All 4 Tier-3+ scenarios present"
else
  echo "! Expected 4 scenarios, found $SCENARIOS"
fi

echo ""
echo "Next steps:"
echo "  1. Clone repository locally"
echo "  2. Run: bash scripts/ONE_SCRIPT_ALL.sh"
echo "  3. Run: bash scripts/ONE_COMMAND_ALL.sh"
echo "  4. Run: bash scripts/operator_loop/verify_gates.sh"
