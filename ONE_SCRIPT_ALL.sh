#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# ONE_SCRIPT_ALL.sh
#
# Purpose:
#   Single-command bootstrap + execution for the Tier-3+ Operator Development
#   System (4-phase, non-scoring, offline, private by default).
#
# Guarantees:
#   - No runtime network calls
#   - No telemetry
#   - Idempotent (safe to re-run)
#   - Explicit opt-in for backups
#
# Usage:
#   bash ONE_SCRIPT_ALL.sh
#
# Optional env vars:
#   OPERATOR_NAME="Your Name"
#   WEEK_ID="2026-W01"
#   QUARTER_ID="2026-Q1"
#   ENABLE_GDRIVE_BACKUP=1
###############################################################################

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info(){ echo "[INFO] $*"; }
warn(){ echo "[WARN] $*" >&2; }
die(){ echo "[ERROR] $*" >&2; exit 1; }

###############################################################################
# CONFIG
###############################################################################
OPERATOR_NAME="${OPERATOR_NAME:-Operator}"
WEEK_ID="${WEEK_ID:-$(date -u +%Y-W%V)}"
QUARTER_ID="${QUARTER_ID:-$(date -u +%Y-Q$((($(date +%-m)-1)/3)+1))}"

SCENARIO_DEFAULT="momentum_bias_trust_break"

SCENARIO_DIR="$ROOT/core/content/interviews/soc_tier3_pack/scenarios"
TEMPLATE_DIR="$ROOT/core/content/interviews/soc_tier3_pack/artifacts/templates"
PHILOSOPHY_DIR="$ROOT/core/content/interviews/soc_tier3_pack/philosophy"
OP_LOOP_DIR="$ROOT/scripts/operator_loop"
EXPORTS_DIR="$ROOT/core/app_data/interviews/exports"
REPORTS_DIR="$ROOT/reports"
DOCS_DIR="$ROOT/docs"

###############################################################################
# PHASE 0 — VERIFY COMPLETENESS
###############################################################################
info "Verifying Tier-3+ system integrity..."

required_files=(
  "$SCENARIO_DIR/momentum_bias_trust_break.yml"
  "$SCENARIO_DIR/regulator_board_collision.yml"
  "$SCENARIO_DIR/insider_threat_false_positive.yml"
  "$SCENARIO_DIR/audit_timebomb_migration.yml"
  "$TEMPLATE_DIR/analyst_memo_tier3plus.md"
  "$PHILOSOPHY_DIR/tier3_evaluation_philosophy.md"
  "$DOCS_DIR/TIER3_PLUS_PHASES.md"
)

for f in "${required_files[@]}"; do
  [[ -f "$f" ]] || die "Missing required file: $f"
done

mkdir -p "$EXPORTS_DIR" "$REPORTS_DIR" "$OP_LOOP_DIR"

###############################################################################
# PHASE 1 — WEEKLY PRESSURE RUN
###############################################################################
info "Phase 1: Weekly pressure run ($SCENARIO_DEFAULT | $WEEK_ID)"

SESSION_DIR="$EXPORTS_DIR/tier3_session_${WEEK_ID}"
MEMO_PATH="$SESSION_DIR/debrief.md"

mkdir -p "$SESSION_DIR"

cat > "$MEMO_PATH" <<EOF
# Tier-3+ Analyst Memo

Timestamp (UTC): $(date -u +"%Y-%m-%dT%H:%M:%SZ")
Operator: $OPERATOR_NAME
Scenario: $SCENARIO_DEFAULT
Mode: pressure
Timebox: 45 minutes
Week: $WEEK_ID

(Use template guidance from analyst_memo_tier3plus.md)
EOF

info "Pressure session memo initialized at:"
info "  $MEMO_PATH"

###############################################################################
# PHASE 2 — QUARTERLY PATTERN MEASUREMENT
###############################################################################
info "Phase 2: Quarterly pattern measurement ($QUARTER_ID)"

PATTERN_REPORT="$REPORTS_DIR/${QUARTER_ID}_pattern_review.md"

cat > "$PATTERN_REPORT" <<EOF
# Tier-3+ Quarterly Pattern Review — $QUARTER_ID

Answer ONLY these three:

1) Did I name the tradeoff before acting?
2) Did I explicitly protect trust?
3) Did authority compress or distribute?

## Evidence
- Sessions reviewed:
$(ls -d "$EXPORTS_DIR"/tier3_session_* 2>/dev/null || echo "None yet")

## Observed Pattern
- Tradeoff naming frequency:
- Trust repair omission:
- Authority compression moments:

EOF

info "Quarterly pattern review scaffold created:"
info "  $PATTERN_REPORT"

###############################################################################
# PHASE 3 — DOCTRINE PROMOTION (GATE CREATION)
###############################################################################
info "Phase 3: Doctrine promotion check"

GATE_FILE="$OP_LOOP_DIR/pre_action_gate.txt"

if [[ ! -f "$GATE_FILE" ]]; then
  cat > "$GATE_FILE" <<EOF
Before irreversible action, operator MUST:
- State the tradeoff out loud
- Name integrity owner
- Execute 5-minute validation pause
EOF
  info "Doctrine gate created:"
  info "  $GATE_FILE"
else
  info "Doctrine gate already exists (unchanged)"
fi

###############################################################################
# PHASE 4 — TIER-4 UNLOCK CHECK (NOT ENABLED)
###############################################################################
info "Phase 4: Tier-4 remains LOCKED by default"
info "Unlock requires ≥70% stability across 2 consecutive quarters"

###############################################################################
# OPTIONAL — GOOGLE DRIVE BACKUP (EXPLICIT OPT-IN)
###############################################################################
if [[ "${ENABLE_GDRIVE_BACKUP:-0}" == "1" ]]; then
  info "Google Drive backup ENABLED (explicit opt-in)"
  if [[ -x "$ROOT/scripts/gdrive_backup_release.sh" ]]; then
    bash "$ROOT/scripts/gdrive_backup_release.sh"
  else
    warn "Backup script not found or not executable"
  fi
else
  info "Google Drive backup SKIPPED (private by default)"
fi

###############################################################################
# FINAL STATUS
###############################################################################
echo
echo "=============================================="
echo " Tier-3+ Operator Development System: READY"
echo "----------------------------------------------"
echo " Operator:        $OPERATOR_NAME"
echo " Week:            $WEEK_ID"
echo " Quarter:         $QUARTER_ID"
echo " Scenario:        $SCENARIO_DEFAULT"
echo " Non-scoring:     YES"
echo " Offline:         YES"
echo " Telemetry:       NONE"
echo "=============================================="
echo
echo "Next actions:"
echo "  • Complete memo:  $MEMO_PATH"
echo "  • End of quarter: edit $PATTERN_REPORT"
echo "  • Promote doctrine when pattern repeats"
echo
echo "Zero scoring. Maximum judgment. Complete privacy."
