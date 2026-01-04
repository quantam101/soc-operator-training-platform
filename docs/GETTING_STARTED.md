# Getting Started

## Step 1: Clone the Repository

```bash
git clone https://github.com/quantam101/soc-operator-training-platform.git
cd soc-operator-training-platform
```

## Step 2: Generate All Scripts

Run the master script to create the entire platform structure:

```bash
bash scripts/ONE_SCRIPT_ALL.sh
```

This creates:
- All helper scripts in `scripts/`
- Operator loop scripts in `scripts/operator_loop/`
- Tier-2 content pack
- Tier-3+ content pack (4 scenarios)
- Documentation

## Step 3: Run the Complete Pipeline

```bash
bash scripts/ONE_COMMAND_ALL.sh
```

This will:
1. Seed Tier-2 interview pack
2. Build 4-phase operator loop scaffolds
3. Generate test sessions
4. Create sample reports
5. Run verification checks

## Step 4: Run Your First Tier-3+ Session

```bash
bash scripts/operator_loop/run_weekly_pressure.sh \
  momentum_bias_trust_break \
  2026-W01 \
  "Your Name"
```

This creates a memo skeleton at:
```
core/app_data/interviews/exports/tier3_session_2026-W01_<timestamp>/debrief.md
```

## Step 5: Complete the Memo

Open the generated `debrief.md` file and fill in:

1. **The moment you should have slowed down**
2. **The tradeoff you didn't articulate**
3. **Authority gravity + delegation**
4. **Trust / social repair cost**
5. **Evidence discipline**
6. **Personal pattern check (operator bias)**
7. **Outcome**

Timebox: **45 minutes** (pressure mode)

## Step 6: Generate Reports

### Operator Development Report

```bash
bash scripts/operator_development_report.sh \
  core/app_data/interviews/exports \
  reports/my_operator_report.md
```

### Instructor Report (Cohort Analysis)

```bash
bash scripts/instructor_report_from_exports.sh \
  core/app_data/interviews/exports \
  reports/instructor_report.md \
  reports/instructor_report.csv
```

## Step 7: Quarter-End Review

After 12 weeks (one quarter), run the quarterly review:

```bash
bash scripts/operator_loop/quarterly_review.sh 2026-Q1
```

Review the output and answer the 3 questions:
1. Did I name the tradeoff before acting?
2. Did I protect trust explicitly or omit it?
3. Did authority compress or distribute under pressure?

## Step 8: Promote Doctrine (Optional)

If you notice a repeated pattern/miss, promote it to a gate:

```bash
bash scripts/operator_loop/promote_doctrine.sh 2026-Q1 \
  "Before irreversible action: state tradeoff + name integrity owner + call 5-minute pause"
```

## Next Steps

- **Add more scenarios**: Create new YAML files in `core/content/interviews/soc_tier3_pack/scenarios/`
- **Build installers**: Run `bash scripts/package_installers.sh` (requires Node.js, npm, Rust)
- **Export PDFs**: Run `bash scripts/export_debrief_to_pdf.sh <debrief.md>` (requires pandoc or python3)
- **Backup to Google Drive**: Configure rclone and run `bash scripts/gdrive_backup_release.sh`

## Troubleshooting

### Scripts not executable

```bash
chmod +x scripts/*.sh
chmod +x scripts/operator_loop/*.sh
```

### Missing dependencies

- **Bash**: Required on all platforms
- **Node.js & npm**: Only needed for building Tauri installers
- **Rust toolchain**: Only needed for building Tauri installers
- **pandoc**: Optional, for best PDF export quality (Python reportlab is fallback)
- **rclone**: Optional, for Google Drive backups

### Session exports not found

Make sure you've run at least one session:

```bash
bash scripts/operator_loop/run_weekly_pressure.sh \
  momentum_bias_trust_break \
  2026-W01 \
  "Test Operator"
```

Then check:
```bash
ls -la core/app_data/interviews/exports/
```
