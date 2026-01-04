# Tier-3+ Scenarios

This directory contains non-scoring judgment development scenarios focused on operator pattern identification and doctrine building.

## Available Scenarios

### 1. Momentum Bias Trust Break
**File:** `momentum_bias_trust_break.yml`

**Targets:**
- Momentum bias (push forward to avoid momentum loss)
- Over-reliance on small trusted group
- Dismissal of early validation anomaly
- Under-weighting social repair cost

**Context:** Post-acquisition integration, rollback mismatch, exec pressure to restore billing

**Key Learning:** Before resuming critical systems after incident, pause to validate state with fresh perspective

---

### 2. Regulator Board Collision
**File:** `regulator_board_collision.yml`

**Targets:**
- Over-optimistic assurance under pressure
- Stakeholder misalignment (regulator vs board priorities)
- Authority compression (single decision maker)
- Evidence boundary clarity (known vs unknown vs assumed)

**Context:** Active incident with competing demands from regulator, board, legal, and engineering

**Key Learning:** Single source of truth to all stakeholders; name what you know vs don't know

---

### 3. Insider Threat False Positive
**File:** `insider_threat_false_positive.yml`

**Targets:**
- Confirmation bias (seeing only supporting evidence)
- Social repair planning (team trust + individual dignity)
- Evidence bar clarity (what's enough to act vs accuse)
- Least-harm containment

**Context:** Ambiguous signal on senior engineer; reputational and legal risk

**Key Learning:** Name the evidence that would DISPROVE your suspicion; preserve dignity

---

### 4. Audit Timebomb Migration
**File:** `audit_timebomb_migration.yml`

**Targets:**
- Scope creep blindness
- Rushed cutover under deadline pressure
- Tradeoff clarity (speed vs audit defensibility)
- Acquired team alignment

**Context:** Post-acquisition system migration with approaching audit window

**Key Learning:** Gated cutover with explicit pause triggers; acquired team has veto on data integrity

---

## Using These Scenarios

### Run a Weekly Pressure Session

```bash
bash scripts/operator_loop/run_weekly_pressure.sh \
  <scenario_id> \
  <YYYY-WW> \
  "Operator Name"
```

Example:
```bash
bash scripts/operator_loop/run_weekly_pressure.sh \
  momentum_bias_trust_break \
  2026-W01 \
  "Jane Doe"
```

### Scenario Structure

Each YAML file contains:
- `id` - Unique scenario identifier
- `title` - Human-readable title
- `tier` - Always "3+" for these scenarios
- `mode` - ["baseline", "pressure"] with different timeboxes
- `timebox_minutes` - 60 for baseline, 45 for pressure
- `targets` - Operator patterns being evaluated
- `context` - Setup details and constraints
- `phases` - Sequential decision points with prompts
- `success_criteria` - What good judgment looks like
- `notes` - Instructor guidance and common pitfalls

### Recommended Sequence

**Week 1-3:** Momentum Bias Trust Break (establish baseline patterns)

**Week 4-6:** Regulator Board Collision (multi-stakeholder complexity)

**Week 7-9:** Insider Threat False Positive (confirmation bias check)

**Week 10-12:** Audit Timebomb Migration (merger social dynamics)

**Repeat:** Cycle through scenarios with increasing pressure mode usage

## Creating New Scenarios

### Template Structure

```yaml
id: my_scenario_id
title: "Descriptive Title"
tier: "3+"
mode: ["baseline", "pressure"]
timebox_minutes:
  baseline: 60
  pressure: 45

targets:
  - "Pattern 1"
  - "Pattern 2"

context:
  - "Setup detail 1"
  - "Setup detail 2"

phases:
  - name: "Phase name"
    prompt: "What do you do?"
    injects:  # Optional
      - "Additional pressure"

success_criteria:
  - "Good judgment indicator 1"
  - "Good judgment indicator 2"

notes: |
  Instructor guidance here
```

### Scenario Design Principles

1. **Target Real Patterns** - Base on actual operator failure modes
2. **Ambiguity Required** - No clear "right answer"
3. **Time Pressure** - 45 minutes forces tradeoff visibility
4. **Multi-Stakeholder** - Competing priorities create real tension
5. **Social Cost** - Trust repair must be explicit

### Common Pitfalls to Avoid

❌ **Don't:** Make scenario scoreable with rubric
✅ **Do:** Make judgment quality pattern-based

❌ **Don't:** Include "trick" or gotcha elements
✅ **Do:** Make pressure realistic (exec demands, time constraints)

❌ **Don't:** Allow easy consensus (everyone agrees on one path)
✅ **Do:** Create legitimate competing priorities

❌ **Don't:** Optimize for single session performance
✅ **Do:** Design for pattern emergence over 12 weeks

## Philosophy

These scenarios evaluate **judgment under ambiguity**, not technical knowledge.

**Read:** `../philosophy/tier3_evaluation_philosophy.md` for complete evaluation framework.

**Key Principle:** Judgment is pattern, not points. Pattern emerges over time, not in one session.
