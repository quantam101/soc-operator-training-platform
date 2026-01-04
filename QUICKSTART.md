# Quick Start Guide

## One-Command Setup

The platform is ready to use immediately after cloning:

```bash
# Clone repository
git clone https://github.com/quantam101/soc-operator-training-platform.git
cd soc-operator-training-platform

# Make executable
chmod +x ONE_SCRIPT_ALL.sh

# Run (creates session + scaffolds)
bash ONE_SCRIPT_ALL.sh
```

## What ONE_SCRIPT_ALL.sh Does

### Phase 0: Verification
- ✅ Verifies all 4 Tier-3+ scenarios exist
- ✅ Verifies template and philosophy documents
- ✅ Creates required directories

### Phase 1: Weekly Pressure Run
- Creates a new session for current week
- Initializes memo at `core/app_data/interviews/exports/tier3_session_<WEEK>/debrief.md`
- Default scenario: `momentum_bias_trust_break`

### Phase 2: Quarterly Pattern Measurement
- Creates pattern review scaffold at `reports/<QUARTER>_pattern_review.md`
- Lists existing sessions for review
- Prompts for 3-question pattern analysis

### Phase 3: Doctrine Promotion
- Creates pre-action gate file at `scripts/operator_loop/pre_action_gate.txt`
- Idempotent (won't overwrite existing gate)

### Phase 4: Tier-4 Check
- Reports status (locked by default)
- Unlock requires 2 consecutive quarters of stable patterns

## Customization

### Set Operator Name
```bash
OPERATOR_NAME="Your Name" bash ONE_SCRIPT_ALL.sh
```

### Set Specific Week
```bash
WEEK_ID="2026-W05" bash ONE_SCRIPT_ALL.sh
```

### Set Quarter
```bash
QUARTER_ID="2026-Q2" bash ONE_SCRIPT_ALL.sh
```

### All Together
```bash
OPERATOR_NAME="Stephen" WEEK_ID="2026-W05" QUARTER_ID="2026-Q2" bash ONE_SCRIPT_ALL.sh
```

## Output Example

```
[INFO] Verifying Tier-3+ system integrity...
[INFO] Phase 1: Weekly pressure run (momentum_bias_trust_break | 2026-W05)
[INFO] Pressure session memo initialized at:
[INFO]   core/app_data/interviews/exports/tier3_session_2026-W05/debrief.md
[INFO] Phase 2: Quarterly pattern measurement (2026-Q2)
[INFO] Quarterly pattern review scaffold created:
[INFO]   reports/2026-Q2_pattern_review.md
[INFO] Phase 3: Doctrine promotion check
[INFO] Doctrine gate created:
[INFO]   scripts/operator_loop/pre_action_gate.txt
[INFO] Phase 4: Tier-4 remains LOCKED by default
[INFO] Unlock requires ≥70% stability across 2 consecutive quarters
[INFO] Google Drive backup SKIPPED (private by default)

==============================================
 Tier-3+ Operator Development System: READY
----------------------------------------------
 Operator:        Stephen
 Week:            2026-W05
 Quarter:         2026-Q2
 Scenario:        momentum_bias_trust_break
 Non-scoring:     YES
 Offline:         YES
 Telemetry:       NONE
==============================================

Next actions:
  • Complete memo:  core/app_data/interviews/exports/tier3_session_2026-W05/debrief.md
  • End of quarter: edit reports/2026-Q2_pattern_review.md
  • Promote doctrine when pattern repeats

Zero scoring. Maximum judgment. Complete privacy.
```

## Next Steps

### 1. Complete Your Memo (45 minutes, pressure mode)

Open the generated memo and fill in all sections:

```bash
# Open in your preferred editor
vim core/app_data/interviews/exports/tier3_session_<WEEK>/debrief.md
```

Use the template at `core/content/interviews/soc_tier3_pack/artifacts/templates/analyst_memo_tier3plus.md` for guidance.

### 2. Review the Scenario

Read the scenario YAML for context:

```bash
cat core/content/interviews/soc_tier3_pack/scenarios/momentum_bias_trust_break.yml
```

### 3. Quarter-End Review

After 12 weeks, edit the pattern review:

```bash
vim reports/<QUARTER>_pattern_review.md
```

Answer the 3 questions:
1. Did I name the tradeoff before acting?
2. Did I explicitly protect trust?
3. Did authority compress or distribute?

### 4. Promote Doctrine (Optional)

If a pattern repeats, update the gate file:

```bash
vim scripts/operator_loop/pre_action_gate.txt
```

## File Locations

| File | Location | Purpose |
|------|----------|---------|
| **Session memo** | `core/app_data/interviews/exports/tier3_session_<WEEK>/debrief.md` | Your completed memo |
| **Pattern review** | `reports/<QUARTER>_pattern_review.md` | Quarterly 3-question analysis |
| **Doctrine gate** | `scripts/operator_loop/pre_action_gate.txt` | Pre-action checklist |
| **Scenarios** | `core/content/interviews/soc_tier3_pack/scenarios/*.yml` | All 4 scenarios |
| **Template** | `core/content/interviews/soc_tier3_pack/artifacts/templates/analyst_memo_tier3plus.md` | Memo guidance |
| **Philosophy** | `core/content/interviews/soc_tier3_pack/philosophy/tier3_evaluation_philosophy.md` | Evaluation criteria |

## Switching Scenarios

Edit `ONE_SCRIPT_ALL.sh` and change `SCENARIO_DEFAULT`:

```bash
SCENARIO_DEFAULT="regulator_board_collision"
# or
SCENARIO_DEFAULT="insider_threat_false_positive"
# or
SCENARIO_DEFAULT="audit_timebomb_migration"
```

## Optional: Google Drive Backup

**Private by default.** To enable backup:

```bash
# One-time: configure rclone
rclone config

# Enable backup
ENABLE_GDRIVE_BACKUP=1 bash ONE_SCRIPT_ALL.sh
```

## Troubleshooting

### Script not executable
```bash
chmod +x ONE_SCRIPT_ALL.sh
```

### Missing scenarios
```bash
ls -la core/content/interviews/soc_tier3_pack/scenarios/
# Should show 4 .yml files
```

### Verify installation
```bash
bash scripts/VERIFY_RELEASE.sh
```

### Check gates
```bash
bash scripts/operator_loop/verify_gates.sh
```

## Privacy & Offline Guarantees

- ✅ **No network calls** during execution
- ✅ **No telemetry** or analytics
- ✅ **No external dependencies** (pure bash)
- ✅ **All data local** (exports, reports, memos)
- ✅ **Backup opt-in only** (explicit ENABLE_GDRIVE_BACKUP=1)

## Philosophy

This is **non-scoring judgment development**:
- ✗ No points
- ✗ No grades  
- ✗ No leaderboards
- ✓ Pattern measurement
- ✓ Doctrine evolution
- ✓ Complete privacy

**Zero scoring. Maximum judgment. Complete privacy.**
