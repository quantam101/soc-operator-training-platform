# Verification Commands

Run these commands to verify the SOC Operator Training Platform is correctly set up.

## 1. Verify All 4 Tier-3+ Scenarios Exist

```bash
ls -la core/content/interviews/soc_tier3_pack/scenarios/
```

**Expected output:**
- `momentum_bias_trust_break.yml` ✓
- `regulator_board_collision.yml` ✓
- `insider_threat_false_positive.yml` ✓
- `audit_timebomb_migration.yml` ✓
- `README.md` (scenarios documentation)

## 2. Verify Content Structure

```bash
# Check Tier-3+ philosophy
ls -la core/content/interviews/soc_tier3_pack/philosophy/

# Check Tier-3+ templates
ls -la core/content/interviews/soc_tier3_pack/artifacts/templates/

# Check documentation
ls -la docs/
```

**Expected:**
- `philosophy/tier3_evaluation_philosophy.md` ✓
- `artifacts/templates/analyst_memo_tier3plus.md` ✓
- `docs/TIER3_PLUS_PHASES.md` ✓
- `docs/GETTING_STARTED.md` ✓

## 3. Verify Core Scripts

```bash
ls -la scripts/
```

**Expected:**
- `ONE_SCRIPT_ALL.sh` (master generator) ✓

**Note:** The ONE_SCRIPT_ALL.sh script will generate all other helper scripts when run:
- `package_installers.sh`
- `export_debrief_to_pdf.sh`
- `soc_tier2_interview_pack.sh`
- `operator_loop/run_weekly_pressure.sh`
- `operator_loop/quarterly_review.sh`
- `operator_loop/promote_doctrine.sh`
- `operator_loop/verify_gates.sh`
- `operator_development_report.sh`
- `instructor_report_from_exports.sh`
- `ONE_COMMAND_ALL.sh`
- `VERIFY_RELEASE.sh`

## 4. Generate All Helper Scripts

```bash
bash scripts/ONE_SCRIPT_ALL.sh
```

This creates the complete platform structure.

## 5. Verify Repository Links

**Repository:** https://github.com/quantam101/soc-operator-training-platform

**Key Files:**
- [README.md](https://github.com/quantam101/soc-operator-training-platform/blob/main/README.md)
- [LICENSE](https://github.com/quantam101/soc-operator-training-platform/blob/main/LICENSE)
- [Getting Started](https://github.com/quantam101/soc-operator-training-platform/blob/main/docs/GETTING_STARTED.md)
- [4-Phase Loop](https://github.com/quantam101/soc-operator-training-platform/blob/main/docs/TIER3_PLUS_PHASES.md)
- [Issue #1: Roadmap](https://github.com/quantam101/soc-operator-training-platform/issues/1)

**Scenarios:**
- [Momentum Bias Trust Break](https://github.com/quantam101/soc-operator-training-platform/blob/main/core/content/interviews/soc_tier3_pack/scenarios/momentum_bias_trust_break.yml)
- [Regulator Board Collision](https://github.com/quantam101/soc-operator-training-platform/blob/main/core/content/interviews/soc_tier3_pack/scenarios/regulator_board_collision.yml)
- [Insider Threat False Positive](https://github.com/quantam101/soc-operator-training-platform/blob/main/core/content/interviews/soc_tier3_pack/scenarios/insider_threat_false_positive.yml)
- [Audit Timebomb Migration](https://github.com/quantam101/soc-operator-training-platform/blob/main/core/content/interviews/soc_tier3_pack/scenarios/audit_timebomb_migration.yml)

**Philosophy:**
- [Tier-3+ Evaluation Philosophy](https://github.com/quantam101/soc-operator-training-platform/blob/main/core/content/interviews/soc_tier3_pack/philosophy/tier3_evaluation_philosophy.md)

**Templates:**
- [Analyst Memo Template](https://github.com/quantam101/soc-operator-training-platform/blob/main/core/content/interviews/soc_tier3_pack/artifacts/templates/analyst_memo_tier3plus.md)

## 6. Quick Start (After Cloning)

```bash
# Clone repository
git clone https://github.com/quantam101/soc-operator-training-platform.git
cd soc-operator-training-platform

# Generate all scripts
bash scripts/ONE_SCRIPT_ALL.sh

# Verify generated scripts
bash scripts/VERIFY_RELEASE.sh

# Run complete pipeline
bash scripts/ONE_COMMAND_ALL.sh

# Start Week 1
bash scripts/operator_loop/run_weekly_pressure.sh \
  momentum_bias_trust_break \
  2026-W01 \
  "Your Name"
```

## 7. Checklist

**Core Infrastructure:**
- [x] Repository created
- [x] MIT License
- [x] Comprehensive README
- [x] Getting Started guide
- [x] 4-Phase documentation

**Tier-3+ Content:**
- [x] 4 scenarios (YAML)
- [x] Evaluation philosophy
- [x] Analyst memo template
- [x] Scenarios README

**Next Steps:**
- [ ] Run ONE_SCRIPT_ALL.sh to generate helper scripts
- [ ] Run VERIFY_RELEASE.sh to validate setup
- [ ] Run first Tier-3+ session
- [ ] Generate test reports

## Status

✅ **All 4 Tier-3+ scenarios uploaded**
✅ **Evaluation philosophy uploaded**
✅ **Memo template uploaded**
✅ **Documentation complete**

**Ready to clone and run!**
