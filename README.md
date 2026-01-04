# SOC Operator Training Platform

> **Offline-first SOC operator development platform with Tier-3+ non-scoring judgment evaluation and 4-phase operator loop.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 🚀 One-Command Start

```bash
git clone https://github.com/quantam101/soc-operator-training-platform.git
cd soc-operator-training-platform
chmod +x ONE_SCRIPT_ALL.sh
bash ONE_SCRIPT_ALL.sh
```

**That's it.** No dependencies, no configuration, no network calls.

See **[QUICKSTART.md](QUICKSTART.md)** for detailed usage.

---

## Overview

This platform provides a complete framework for **non-scoring operator development**:

1. **Weekly Pressure Runs** (45 minutes) - One scenario per week, one memo per session
2. **Quarterly Pattern Measurement** - Answer 3 questions about judgment patterns
3. **Doctrine Promotion** - Repeated misses become enforceable gates
4. **Tier-4 Unlock** (optional) - External consequence scenarios (regulator/board/legal)

### What Makes This Different

- **Non-scoring**: No points, no grades, no leaderboards
- **Offline-first**: No runtime network calls
- **Privacy-focused**: No telemetry, all data local
- **Judgment-focused**: Evaluates tradeoff clarity, authority distribution, trust repair

---

## Key Features

- ✅ **4 Complete Tier-3+ Scenarios** ready to use
- ✅ **Idempotent scripts** (safe to re-run)
- ✅ **Zero configuration** (works immediately after clone)
- ✅ **Complete privacy** (no telemetry, no analytics)
- ✅ **Deterministic** (same inputs → same outputs)

---

## What ONE_SCRIPT_ALL.sh Does

### Phase 0: Verification
Confirms all 4 scenarios, templates, and philosophy documents exist.

### Phase 1: Weekly Pressure Run
Creates a new session for the current week with initialized memo template.

### Phase 2: Quarterly Pattern Measurement
Scaffolds a pattern review with the 3 critical questions:
1. Did I name the tradeoff before acting?
2. Did I explicitly protect trust?
3. Did authority compress or distribute?

### Phase 3: Doctrine Promotion
Creates a pre-action gate file (idempotent, won't overwrite).

### Phase 4: Tier-4 Check
Reports unlock status (locked by default, requires 2 quarters of stable patterns).

---

## 4 Tier-3+ Scenarios Included

### 1. Momentum Bias Trust Break
**Targets**: Momentum bias, over-reliance on trusted group, dismissal of early signals  
**Context**: Post-acquisition integration, rollback mismatch, exec pressure to restore billing

### 2. Regulator Board Collision
**Targets**: Over-optimistic assurance, stakeholder misalignment, authority compression  
**Context**: Active incident with competing demands from regulator and board

### 3. Insider Threat False Positive
**Targets**: Confirmation bias, social repair planning, evidence discipline  
**Context**: Flagged senior engineer, ambiguous signal, reputational blast radius

### 4. Audit Timebomb Migration
**Targets**: Scope creep blindness, rushed cutover, tradeoff clarity  
**Context**: System migration with audit deadline, incomplete validation

---

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

---

## File Structure

```
.
├── ONE_SCRIPT_ALL.sh                    # Single-command bootstrap
├── QUICKSTART.md                        # Detailed usage guide
├── LICENSE
├── README.md
├── scripts/
│   ├── VERIFY_RELEASE.sh                # Sanity check
│   └── operator_loop/
│       ├── verify_gates.sh              # Gate verification
│       └── pre_action_gate.txt          # Doctrine gate (generated)
├── docs/
│   ├── GETTING_STARTED.md
│   └── TIER3_PLUS_PHASES.md             # 4-phase documentation
├── core/
│   ├── app_data/interviews/exports/     # Session memos (generated)
│   └── content/interviews/soc_tier3_pack/
│       ├── scenarios/                   # 4 scenarios (YAML)
│       ├── philosophy/                  # Evaluation philosophy
│       └── artifacts/templates/         # Memo template
└── reports/                             # Pattern reviews (generated)
```

---

## Verification

### Check All 4 Scenarios
```bash
ls -la core/content/interviews/soc_tier3_pack/scenarios/
```

Expected output:
```
momentum_bias_trust_break.yml
regulator_board_collision.yml
insider_threat_false_positive.yml
audit_timebomb_migration.yml
```

### Run Verification Scripts
```bash
bash scripts/VERIFY_RELEASE.sh
bash scripts/operator_loop/verify_gates.sh
```

---

## Philosophy

### Non-Scoring Judgment Development

**Evaluates**:
- ✓ Tradeoff clarity (what you sacrifice and why)
- ✓ Authority distribution (compress vs distribute)
- ✓ Pause opportunity design (where to slow down)
- ✓ Trust repair planning (social cost)
- ✓ Evidence discipline (known/unknown/assumed)

**Does NOT**:
- ✗ Numeric scores
- ✗ Grades or bands
- ✗ Leaderboards
- ✗ Opaque ML models

### Success Metrics

A strong memo includes:
- ✓ Tradeoff stated before irreversible action
- ✓ Pause designed and executed
- ✓ Authority distributed (R/A/C/I defined)
- ✓ Trust repair plan explicit
- ✓ Operator bias named + micro-rule enforceable

---

## Privacy & Offline Guarantees

- ✅ **No network calls** during execution
- ✅ **No telemetry** or analytics
- ✅ **No external dependencies** (pure bash)
- ✅ **All data local** (exports, reports, memos)
- ✅ **Backup opt-in only** (explicit `ENABLE_GDRIVE_BACKUP=1`)

---

## Optional: Google Drive Backup

**Private by default.** To enable:

```bash
# One-time: configure rclone
rclone config

# Enable backup on each run
ENABLE_GDRIVE_BACKUP=1 bash ONE_SCRIPT_ALL.sh
```

---

## Documentation

- **[QUICKSTART.md](QUICKSTART.md)** - Detailed quick start guide
- **[GETTING_STARTED.md](docs/GETTING_STARTED.md)** - Step-by-step walkthrough
- **[TIER3_PLUS_PHASES.md](docs/TIER3_PLUS_PHASES.md)** - 4-phase loop documentation
- **[Evaluation Philosophy](core/content/interviews/soc_tier3_pack/philosophy/tier3_evaluation_philosophy.md)** - Non-scoring judgment criteria

---

## Contributing

Contributions welcome! Extend with:
- New Tier-3+ scenarios (YAML files)
- Additional verification scripts
- Documentation improvements
- Reporting enhancements

See **[Issue #1](https://github.com/quantam101/soc-operator-training-platform/issues/1)** for implementation roadmap.

---

## License

MIT License - See [LICENSE](LICENSE)

---

**Built for offline SOC operator development.**  
**Zero scoring. Maximum judgment. Complete privacy.**
