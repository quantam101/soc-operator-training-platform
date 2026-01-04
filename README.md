# SOC Operator Training Platform

> Offline-first SOC interview and operator development platform with Tier-2 scoring, Tier-3+ judgment evaluation, and 4-phase operator development loop.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

This platform provides a complete framework for:

1. **Tier-2 SOC Interview Practice** - Structured, scored interview scenarios with branching logic
2. **Tier-3+ Operator Development** - Non-scoring judgment evaluation focusing on tradeoff clarity, authority distribution, and trust repair
3. **Instructor/Operator Reporting** - Comprehensive reporting tools for cohort analysis and individual development tracking
4. **4-Phase Operator Loop** - Weekly pressure runs, quarterly reviews, doctrine promotion, and pattern measurement

## Key Features

- **Offline-first**: No runtime network calls, deterministic behavior
- **No telemetry**: Privacy-focused, no analytics or tracking
- **Idempotent scripts**: Safe to re-run, fail-fast with clear errors
- **Cross-platform**: Build installers for Windows (MSI), macOS (DMG), Linux (DEB/RPM/AppImage)
- **Export formats**: Markdown, JSON, and PDF (via pandoc or Python fallback)

## Quick Start

### Prerequisites

- Bash shell
- Node.js & npm (for Tauri builds)
- Rust toolchain (for Tauri builds)
- Optional: pandoc (for best PDF export quality)
- Optional: rclone (for Google Drive backups)

### Generate All Scripts

The master script creates the entire platform structure:

```bash
bash scripts/ONE_SCRIPT_ALL.sh
```

This generates:
- All helper scripts in `scripts/`
- Operator loop scripts in `scripts/operator_loop/`
- Tier-2 content pack in `core/content/interviews/soc_tier2_pack/`
- Tier-3+ content pack in `core/content/interviews/soc_tier3_pack/`
- Documentation in `docs/`

### Run the Complete Pipeline

```bash
bash scripts/ONE_COMMAND_ALL.sh
```

This will:
1. Seed Tier-2 interview pack
2. Build 4-phase operator loop scaffolds
3. Generate test sessions
4. Create operator and instructor reports
5. Run verification checks

## Platform Components

### Tier-2 (Scored Interview Practice)

**Philosophy**: Signal-based rubric with deterministic branching

**Content**:
- Question bank with expected signals
- Scoring rubric (Strong/Medium/Weak bands)
- Branching rules based on response signals
- Debrief templates

**Usage**:
```bash
bash scripts/soc_tier2_interview_pack.sh
```

### Tier-3+ (Judgment Development)

**Philosophy**: Non-scoring evaluation of judgment under ambiguity

**Evaluates**:
- Tradeoff clarity (what you sacrifice and why)
- Authority distribution (compress vs distribute)
- Pause opportunity design (where to slow down)
- Trust repair planning (social cost)
- Evidence discipline (known/unknown/assumed)

**Does NOT**:
- No numeric scores
- No grades or leaderboards
- No opaque ML models

**Key Scenarios** (4 included):
1. `momentum_bias_trust_break` - Business halt with trust break
2. `regulator_board_collision` - Stakeholder conflict during incident
3. `insider_threat_false_positive` - Social repair cost exercise
4. `audit_timebomb_migration` - Scope creep blindness pattern

### 4-Phase Operator Development Loop

#### Phase 1: Weekly Pressure Run (45 minutes)

```bash
bash scripts/operator_loop/run_weekly_pressure.sh \
  momentum_bias_trust_break \
  2026-W01 \
  "Your Name"
```

Creates a memo skeleton in `core/app_data/interviews/exports/`

#### Phase 2: Quarterly Pattern Measurement

```bash
bash scripts/operator_loop/quarterly_review.sh 2026-Q1
```

Answers 3 questions:
1. Did I name the tradeoff before acting?
2. Did I protect trust explicitly or omit it?
3. Did authority compress or distribute under pressure?

#### Phase 3: Promote Doctrine (Pattern → Gate)

```bash
bash scripts/operator_loop/promote_doctrine.sh 2026-Q1 \
  "Before irreversible action: state tradeoff + name integrity owner + call 5-minute pause"
```

Promotes repeated misses into enforceable gates.

#### Phase 4: Verify Gates

```bash
bash scripts/operator_loop/verify_gates.sh
```

Validates that gates and constraints are in place.

## Reporting Tools (Option D)

### Operator Development Report

```bash
bash scripts/operator_development_report.sh \
  core/app_data/interviews/exports \
  reports/operator_report.md
```

### Instructor Report

```bash
bash scripts/instructor_report_from_exports.sh \
  core/app_data/interviews/exports \
  reports/instructor_report.md \
  reports/instructor_report.csv
```

### Trend Analysis

```bash
bash scripts/operator_trend_analysis.sh \
  reports/q1_report.md \
  reports/q2_report.md \
  reports/trends.md
```

## Building Installers

```bash
# Clean build
CLEAN=1 bash scripts/package_installers.sh

# Fast rebuild (skip npm ci)
SKIP_NPM_CI=1 bash scripts/package_installers.sh
```

Outputs:
- Windows: `core/src-tauri/target/release/bundle/msi/`
- macOS: `core/src-tauri/target/release/bundle/dmg/`
- Linux: `core/src-tauri/target/release/bundle/deb/` (or rpm/AppImage)

## Export & Backup

### PDF Export

```bash
bash scripts/export_debrief_to_pdf.sh \
  core/app_data/interviews/exports/session_123/debrief.md
```

### Google Drive Backup (Optional)

```bash
# One-time setup
rclone config

# Backup
GDRIVE_REMOTE=gdrive \
GDRIVE_BASE_DIR=LifelongCatchCorrect \
bash scripts/gdrive_backup_release.sh
```

## Directory Structure

```
.
├── core/
│   ├── app_data/interviews/exports/    # Session exports
│   ├── content/interviews/
│   │   ├── soc_tier2_pack/             # Tier-2 content
│   │   └── soc_tier3_pack/             # Tier-3+ content
│   │       ├── scenarios/              # 4 scenarios
│   │       ├── philosophy/             # Evaluation philosophy
│   │       └── artifacts/templates/    # Memo templates
│   └── src-tauri/                      # Tauri desktop app
├── scripts/
│   ├── ONE_SCRIPT_ALL.sh              # Master generator
│   ├── ONE_COMMAND_ALL.sh             # Complete pipeline
│   ├── operator_loop/                  # 4-phase loop scripts
│   ├── package_installers.sh           # Tauri build
│   ├── export_debrief_to_pdf.sh       # PDF export
│   └── *_report*.sh                    # Reporting tools
├── docs/
│   ├── TIER3_PLUS_PHASES.md           # 4-phase documentation
│   └── TIER3_QUARTER_CONSTRAINT.txt   # Current constraint
└── reports/                            # Generated reports
```

## Architecture Principles

1. **Offline-first**: No runtime network dependencies
2. **Deterministic**: Same inputs → same outputs
3. **Idempotent**: Scripts safe to re-run
4. **Fail-fast**: Clear error messages, no silent failures
5. **Privacy-focused**: No telemetry, analytics, or tracking
6. **Local-first**: All data stays on user's machine

## New Chat Continuation

```bash
bash scripts/rube_new_chat_prompt.sh
```

Prints (and optionally copies to clipboard) a continuation prompt with full context.

## License

MIT License

## Contributing

Contributions welcome! Extend with:
- New Tier-3+ scenarios
- Additional reporting metrics
- UI improvements
- New export formats

---

**Built for offline SOC operator development. No cloud dependencies. Full privacy.**
