# Getting Started

## Step 1: Clone the Repository

```bash
git clone https://github.com/quantam101/soc-operator-training-platform.git
cd soc-operator-training-platform
```

## Step 2: Generate All Scripts

```bash
bash scripts/ONE_SCRIPT_ALL.sh
```

Creates all helper scripts, operator loop scripts, content packs, and documentation.

## Step 3: Run the Complete Pipeline

```bash
bash scripts/ONE_COMMAND_ALL.sh
```

Runs: Tier-2 seed, 4-phase scaffolds, test sessions, reports, verification.

## Step 4: Run Your First Tier-3+ Session

```bash
bash scripts/operator_loop/run_weekly_pressure.sh momentum_bias_trust_break 2026-W01 "Your Name"
```

Output: `core/app_data/interviews/exports/tier3_session_2026-W01_<timestamp>/debrief.md`

## Step 5: Complete the Memo

Open the generated `debrief.md` and fill in all sections. Timebox: **45 minutes** (pressure mode).

## Step 6: Generate Reports

```bash
# Operator development report
bash scripts/operator_development_report.sh core/app_data/interviews/exports reports/my_operator_report.md

# Instructor report (cohort analysis)
bash scripts/instructor_report_from_exports.sh core/app_data/interviews/exports reports/instructor_report.md reports/instructor_report.csv
```

## Step 7: Quarter-End Review

```bash
bash scripts/operator_loop/quarterly_review.sh 2026-Q1
```

Answer the 3 questions about tradeoff, trust, and authority patterns.

## Step 8: Promote Doctrine (Optional)

If you notice a repeated miss:

```bash
bash scripts/operator_loop/promote_doctrine.sh 2026-Q1 "Before irreversible action: state tradeoff + name integrity owner + call 5-minute pause"
```

## Next Steps

- **Add scenarios**: Create YAML in `core/content/interviews/soc_tier3_pack/scenarios/`
- **Build installers**: `bash scripts/package_installers.sh` (requires Node.js, npm, Rust)
- **Export PDFs**: `bash scripts/export_debrief_to_pdf.sh <debrief.md>` (requires pandoc or python3)
- **Backup to Drive**: Configure rclone and run `bash scripts/gdrive_backup_release.sh`

## Troubleshooting

### Scripts not executable

```bash
chmod +x scripts/*.sh
chmod +x scripts/operator_loop/*.sh
```

### Missing dependencies

- **Bash**: Required
- **Node.js & npm**: Only for Tauri installers
- **Rust**: Only for Tauri installers
- **pandoc**: Optional for PDF (Python reportlab fallback)
- **rclone**: Optional for Google Drive backups
