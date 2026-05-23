# Contributing to Allergos

Thank you for your interest in contributing. Allergos is a clinical AI assistant skill — contributions must maintain the highest standards of evidence-based medicine and patient safety.

## Before You Start

1. **Read [PROJECT.md](./PROJECT.md)** for design principles, conventions, and module architecture.
2. **Read [SKILL.md](./SKILL.md)** to understand the full scope and tone of the skill.
3. Check open issues to avoid duplicating work.

## What We Welcome

- **Clinical content updates**: New guidelines, updated reference values, corrected evidence levels
- **New allergen entries**: Expanding the Cross-Reactivity Encyclopedia or Component-Resolved Diagnosis tables
- **Case studies**: Well-structured examples for `examples/` following the existing template
- **Module expansions**: New sub-sections within existing modules (discuss first via issue)
- **Safety improvements**: Stronger gates, clearer emergency triggers, additional contraindications
- **Documentation**: README improvements, clearer quickstart guides

## What We Cannot Accept

- Recommendations not traceable to a published guideline or peer-reviewed source
- Content that weakens safety boundaries or Pre-Action Checklist gates
- References to unvalidated tests (IgG food panels, ALCAT, kinesiology, Vega, hair analysis, etc.)
- Dosing recommendations without explicit source citation
- Any content that could be interpreted as replacing physician judgment

## Contribution Process

1. **Open an issue** describing what you want to change and why, citing the guideline or paper.
2. **Fork and branch**: `feature/your-change-name` or `fix/your-fix-name`.
3. **Follow conventions** in PROJECT.md — US English, SI units, INN drug names, WAO severity grading.
4. **Include evidence**: Every clinical claim must have a traceable source. Use PMID references where available.
5. **Test safety boundaries**: Verify that Pre-Action Checklists still gate correctly and anaphylaxis triggers still interrupt.
6. **Submit a PR** referencing the issue number.

## Code of Conduct

- Prioritize patient safety above all else.
- Assume good faith in discussions.
- Disagreements should be resolved by citing evidence, not opinion.
- Clinical disagreements without clear evidence — escalate to a broader community discussion.

## Review Criteria

PRs are reviewed against:
- [ ] Evidence traceability — is every clinical claim sourced?
- [ ] Safety — are Pre-Action Checklists intact? Are emergency exit triggers preserved?
- [ ] Consistency — does the content match the tone and structure of existing modules?
- [ ] Completeness — does a new module include at least one example?