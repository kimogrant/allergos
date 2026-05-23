<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-blue" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-green" alt="License">
  <img src="https://img.shields.io/badge/modules-8-orange" alt="Modules">
  <img src="https://img.shields.io/badge/status-stable-brightgreen" alt="Status">
</p>

---

# Allergos

**Clinical AI Assistant for Allergy & Immunology** — structured, evidence-based decision support across the full spectrum of allergic disease.

Named from Greek *allos* (ἄλλος, foreign) + *ergon* (ἔργον, reaction): the immune system's reaction to a foreign substance.

---

## Why Allergos

Allergic diseases affect 30–40% of the global population, yet access to allergy specialists is severely limited. Allergos provides:

- **Structured clinical reasoning**: Every output follows consistent, auditable templates
- **Pre-Action Checklist gates**: Pauses and requests missing data before generating any assessment — no hallucinated recommendations
- **Emergency-first routing**: Anaphylaxis recognition triggers immediate exit to emergency protocol — AI never delays epinephrine
- **Evidence-first architecture**: All recommendations trace to WAO, EAACI, AAAAI/ACAAI, GINA, and PRACTALL guidelines with PMID citations

---

## Modules

| # | Module | What It Covers |
|---|--------|----------------|
| 1 | **Allergy History & Classification** | Structured history-taking, Gell & Coombs typing, WAO 2020 severity grading |
| 2 | **Diagnostic Reasoning & Testing** | SPT, sIgE, component-resolved diagnosis (CRD), oral food challenges, drug provocation |
| 3 | **Cross-Reactivity Encyclopedia** | Pollen-food syndrome, food-food, drug-drug cross-reactivity tables with evidence levels |
| 4 | **Anaphylaxis Emergency Protocol** | Acute management, weight-based epinephrine dosing, biphasic monitoring, discharge criteria |
| 5 | **Pharmacotherapy & Immunotherapy** | ARIA step therapy, SCIT/SLIT protocols, biologics (omalizumab, dupilumab, mepolizumab) |
| 6 | **Pediatric Allergy** | Milk/egg ladders, FPIES, eosinophilic esophagitis, early introduction (LEAP/EAT) |
| 7 | **Patient Action Plans** | Personalized anaphylaxis plans, food allergy management, asthma action plans |
| 8 | **Environmental Management** | Allergen avoidance evidence tables, occupational allergy screening |

Each module operates behind a **Pre-Action Checklist** gate — the assistant will not proceed until all required clinical information is provided.

---

## Quickstart

### Prerequisites

- Any AI assistant platform that supports custom skill files (`.md` format).
- No additional dependencies, API keys, or software required.

### Installation

1. **Download** [`SKILL.md`](./SKILL.md) from this repository.
2. **Load** it into your AI assistant skill directory.
3. **Start a session** with a clinical question:

```
Patient: 8-month-old with eczema, vomiting 2 hours after formula. Suspected CMPA.
```

The assistant will walk through structured history-taking, generate a differential, and produce a graded milk ladder if indicated.

### Example Outputs

Real-world case studies are available in [`examples/`](./examples/):

| File | Scenario |
|------|----------|
| `1-pediatric-food-allergy.md` | Infant with suspected CMPA — structured history, milk ladder |
| `2-anaphylaxis-emergency.md` | Acute peanut anaphylaxis — emergency protocol, post-event plan |
| `3-immunotherapy-workup.md` | Allergic rhinitis — ARIA step therapy, SCIT/SLIT candidacy |

---

## Safety Architecture

```
User Input
    │
    ├─ Anaphylaxis Trigger Detected?
    │   └─ YES → ⛔ EXIT. Epinephrine protocol ONLY. Route to 911.
    │
    ├─ Pre-Action Checklist Passed?
    │   └─ NO  → ⛔ PAUSE. Request missing data. Do not proceed.
    │
    └─ All gates clear → Proceed with evidence-based output
```

### Emergency Triggers

The assistant immediately exits to emergency protocol if **any** of these are present:

- Difficulty breathing, stridor, or wheezing after allergen exposure
- Swelling of lips, tongue, or throat
- Dizziness, hypotension, or collapse after exposure
- Two or more organ systems involved acutely
- Known allergen exposure + any systemic symptom within minutes to 2 hours

---

## Guidelines Referenced

| Guideline | Year | Issuing Body |
|-----------|------|-------------|
| Anaphylaxis Guidelines | 2020 | WAO |
| Anaphylaxis Guidelines | 2021 | EAACI |
| Allergic Rhinitis (ARIA) | 2020 | ARIA/WHO |
| Urticaria Guidelines | 2022 | EAACI/GA²LEN/EDF/WAO |
| Atopic Dermatitis | 2023 | AAD |
| Asthma (GINA) | 2023 | GINA |
| Oral Food Challenges (PRACTALL) | 2012 | AAAAI/EAACI/WAO |
| Molecular Allergology User's Guide 2.0 | 2022 | EAACI |
| Venom Immunotherapy | 2016 | AAAAI/ACAAI |
| Milk Allergy (BSACI) | 2020 | BSACI |
| Milk Ladder (iMAP) | 2022 | iMAP |
| FPIES Guidelines | 2021 | NHS |
| LEAP / LEAP-On / EAT Studies | 2015–2016 | NEJM |

---

## Contributing

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for guidelines, review criteria, and the pull request process.

We welcome:
- Clinical content updates with guideline citations
- New allergen entries for the Cross-Reactivity Encyclopedia
- Case study contributions
- Safety boundary improvements

---

## License

MIT — see [`LICENSE`](./LICENSE).

---

## Disclaimer

Allergos is a clinical decision support tool, not a replacement for physician judgment. Always verify recommendations against current guidelines and individual patient factors. In any emergency, administer epinephrine and activate emergency medical services — do not consult an AI assistant.