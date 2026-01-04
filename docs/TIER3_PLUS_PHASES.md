# Tier-3+ Operator Loop: 4 Phases

## Philosophy

Tier-3+ is **non-scoring judgment development** under ambiguity. Not points, not grades.

## Phase 1 — Weekly Pressure Run (45 minutes)

- One scenario per week
- One memo per session (no rewrites)
- Must include: tradeoff, authority distribution, pause opportunity, trust repair

### Run a Session

```bash
bash scripts/operator_loop/run_weekly_pressure.sh momentum_bias_trust_break 2026-W01 "Operator Name"
```

Output: `core/app_data/interviews/exports/tier3_session_2026-W01_*/debrief.md`

## Phase 2 — Quarterly Pattern Measurement

Answer 3 questions:

1) **Tradeoff**: Did I name the tradeoff before acting?
2) **Trust**: Did I protect trust explicitly or omit it?
3) **Authority**: Did authority compress or distribute under pressure?

### Run Review

```bash
bash scripts/operator_loop/quarterly_review.sh 2026-Q1
```

Output: `reports/2026-Q1_quarterly_review.md`

## Phase 3 — Doctrine Promotion (Pattern → Gate)

If a miss repeats, promote it to a **gate** (pre-action checklist).

### Promote a Gate

```bash
bash scripts/operator_loop/promote_doctrine.sh 2026-Q1 "Before irreversible action: state tradeoff + name integrity owner + call 5-minute pause"
```

Updates:
- `docs/TIER3_GATES.md` (append-only history)
- `docs/TIER3_QUARTER_CONSTRAINT.txt` (current constraint)

## Phase 4 — Tier-4 Unlock (Optional)

**Locked by default**. Tier-4 adds external consequence (regulator/board/legal conflict).

**Unlock criteria**: Two quarters of stable Phase 1-3 patterns.

## Verification

```bash
bash scripts/operator_loop/verify_gates.sh
```

## Success Metrics (Non-Scoring)

**Good memo**:
- ✓ Tradeoff stated before irreversible action
- ✓ Pause designed and executed
- ✓ Authority distributed
- ✓ Trust repair plan explicit
- ✓ Operator bias named + micro-rule enforceable

**NOT measured**:
- ✗ Numeric score
- ✗ Grade or band
- ✗ Leaderboard position
