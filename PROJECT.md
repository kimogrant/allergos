# Project: Allergos

## Overview

Allergos is a clinical AI assistant skill for allergy and immunology. Named from Greek "allos" (ἄλλος, other/foreign) + "ergon" (ἔργον, reaction), it provides structured, evidence-based clinical decision support across eight core modules spanning the full spectrum of allergic disease management.

## Design Principles

### 1. Safety-First Architecture

Every module enforces a **Pre-Action Checklist** gate before producing output. This ensures critical clinical information is present before any assessment, recommendation, or protocol is generated. The assistant will pause and request missing data rather than proceed with incomplete information.

### 2. Evidence-First, Not Speculation

All recommendations trace to published guidelines (WAO, EAACI, AAAAI/ACAAI, GINA, PRACTALL) and peer-reviewed literature with PMID references. The skill explicitly warns against unvalidated testing (IgG food panels, ALCAT, kinesiology, etc.) and refuses to validate pseudoscientific practices.

### 3. Emergency Routing Priority

Anaphylaxis recognition triggers immediate exit — the assistant outputs ONLY the emergency protocol (epinephrine administration + call 911) and refuses any other analysis until the emergency is managed.

### 4. Structured Clinical Reasoning

All outputs follow consistent, auditable templates: tables with severity grading, structured history-taking checklists, and decision trees that mirror real-world clinical workflows.

## Repository Structure

```
allergos/
├── SKILL.md              # Core skill definition (~60 KB, 8 modules)
├── README.md             # Project homepage with badges, quickstart, and module index
├── LICENSE               # MIT License
├── PROJECT.md            # This file — development guidelines and conventions
├── CONTRIBUTING.md       # How to contribute
├── .gitignore            # Ignored files
└── examples/             # Real-world case studies
    ├── 1-pediatric-food-allergy.md
    ├── 2-anaphylaxis-emergency.md
    └── 3-immunotherapy-workup.md
```

## Module Architecture

| # | Module | Scope |
|---|--------|-------|
| 1 | Allergy History & Classification | Structured history-taking, Gell & Coombs typing, WAO severity grading |
| 2 | Diagnostic Reasoning & Testing | SPT, sIgE, CRD, OFC, drug provocation test interpretation |
| 3 | Cross-Reactivity Encyclopedia | Pollen-food syndrome, food-food, drug-drug cross-reactivity tables |
| 4 | Anaphylaxis Emergency Protocol | Acute management, epinephrine dosing, biphasic monitoring, discharge planning |
| 5 | Pharmacotherapy & Immunotherapy | ARIA step therapy, SCIT/SLIT protocols, biologics (omalizumab, dupilumab, mepolizumab) |
| 6 | Pediatric Allergy | Milk/egg ladders, FPIES, EoE, early introduction protocols (LEAP/EAT) |
| 7 | Patient Action Plans | Personalized anaphylaxis plans, food allergy management, asthma action plans |
| 8 | Environmental Management | Allergen avoidance evidence tables, occupational allergy screening |

## Conventions

### File Format

- All project files are written in **English** (US spelling).
- Markdown is the primary format (`.md`).

### Clinical Content

- Drug names use **INN** (International Nonproprietary Names) with US brand names in parentheses on first mention.
- Lab values use **SI units** with conventional US units in brackets where relevant.
- Severity grading follows **WAO 2020** nomenclature.
- All guideline references include year and issuing body.

### Review Standards

- Every clinical claim must be traceable to a published guideline or peer-reviewed source.
- Safety boundaries must be explicit and non-negotiable.
- Pre-Action Checklists must cover all information required before module output.
- New modules must include at least one worked example in `examples/`.

### Versioning

Semantic versioning (`MAJOR.MINOR.PATCH`):
- **MAJOR**: New module, architectural change, or breaking protocol change
- **MINOR**: New feature within existing module, expanded reference tables
- **PATCH**: Clarifications, typo fixes, reference updates

## Roadmap

- [ ] Module 9: Drug Allergy & Desensitization (expanded standalone module)
- [ ] Module 10: Chronic Urticaria & Angioedema (CSU, HAE, AAE pathways)
- [ ] Interactive OFC risk calculator integration
- [ ] Multilingual patient handouts (Spanish, French, Mandarin)
- [ ] SMART-compatible FHIR allergy profiles