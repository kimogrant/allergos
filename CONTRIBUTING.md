# Contributing to Allergos

Contributions welcome from allergists/immunologists, primary care clinicians, and health informaticists.

## Repository layout

```text
allergos/
├── SKILL.md              # Frontmatter, hard rules, module index (keep concise)
├── references/           # One file per module + safety + guidelines
├── examples/             # End-to-end case studies
├── VERSION
└── skill.sh              # Install into .cursor/skills/allergos/
```

## Workflow

1. Fork and clone `https://github.com/kimogrant/allergos.git`
2. Branch: `git checkout -b fix/module-02-sige-wording`
3. Edit the relevant `references/module-*.md` (not a monolithic SKILL body)
4. If triggers or hard rules change, update `SKILL.md` only
5. Add or update an `examples/` case when behavior changes materially
6. Bump `VERSION` and `references/changelog.md`
7. Open a PR with `[Module N]` or `[Safety]` prefix

## Standards

- Cite **PMID + year** or **guideline body + year** for new clinical claims
- Drug and biologic ages: note label jurisdiction; add changelog entry when updating
- Every module keeps a **Pre-Action Checklist**; do not remove gates without safety review
- **Anaphylaxis**: never reorder emergency block after disclaimer or checklist
- Reject content that endorses IgG food panels, ALCAT, or unsupervised OIT/SCIT dosing

## Regenerating references (maintainers)

If merging a large edit from a single file, use:

```bash
python scripts/split_skill.py
```

Only run against a monolithic draft; the canonical source is `references/*.md`.

## Review

- Clinical changes: at least one reviewer with allergy/immunology background
- README / install / frontmatter: maintainer review sufficient

## Related projects

- [clinical-skills (Hippocrates)](https://github.com/kimogrant/clinical-skills) — general clinical modules
