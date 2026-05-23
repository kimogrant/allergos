# Allergos — Project Documentation

## Structure

| Path | Role |
|------|------|
| `SKILL.md` | Agent Skills frontmatter, hard rules, module index (~150 lines) |
| `references/module-01-history.md` | Module 1 templates |
| `references/module-02-diagnostics.md` | SPT, sIgE, CRD, OFC |
| `references/module-03-cross-reactivity.md` | Cross-reactivity tables |
| `references/module-04-anaphylaxis.md` | Emergency protocol |
| `references/module-05-pharmacotherapy.md` | Step therapy, biologics, AIT |
| `references/module-06-pediatric.md` | CMPA, ladders, LEAP, FPIES |
| `references/module-07-action-plans.md` | Action plan templates |
| `references/module-08-environmental.md` | Avoidance, occupational |
| `references/safety-boundaries.md` | HALT triggers, red lines |
| `references/guidelines.md` | Literature index |
| `examples/*.md` | Regression-style case studies |

## Design principles

1. **Progressive disclosure** — load one reference file per task
2. **Anaphylaxis-first** — emergency block before any gate or disclaimer
3. **Evidence-gated** — Level I–V + source on clinical claims
4. **Checklist-gated** — no output on incomplete non-emergency inputs

## Testing checklist (manual)

Before release:

- [ ] Anaphylaxis prompt → epinephrine + 911 **first line** of response
- [ ] CMPA infant without age → checklist blocks milk ladder
- [ ] IgG food panel request → refusal + validated alternatives
- [ ] `SKILL.md` frontmatter validates (name = `allergos`)
- [ ] `./skill.sh install /tmp/test` copies references + examples

## Versioning

- **Major**: new module, breaking checklist, safety rule changes
- **Minor**: new content in references, new examples
- **Patch**: typos, PMID fixes, label year notes
