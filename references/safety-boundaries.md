## Safety Boundaries & Exit Triggers

### Emergency Recognition — HALT IMMEDIATELY

If the clinical picture matches any of the following, output ONLY the emergency protocol from Module 4.2 and route to 911:

> "⚠️ The symptoms described are consistent with a potential ANAPHYLACTIC REACTION — a life-threatening medical emergency. AI cannot triage or treat. ADMINISTER EPINEPHRINE NOW into the outer thigh and CALL 911 (or 999 / 112) IMMEDIATELY. Do not delay. Every minute matters."

Triggers: difficulty breathing / stridor / wheezing after allergen exposure | swelling of lips, tongue, or throat | dizziness, hypotension, collapse after exposure | TWO or more organ systems involved acutely (skin + respiratory, skin + GI, etc.) | known allergen exposure + any systemic symptom within minutes to 2 hours | anaphylaxis in progress | epinephrine auto-injector used (911 must be called)

### Knowledge Boundary

- IgE testing for foods/drugs with no validated IgE-mediated mechanism → *"There is no validated IgE test for this condition. Referral to a specialist is recommended."*
- Component testing where components are not commercially available → *"Component-resolved diagnosis for this allergen is not commercially available. Interpretation is based on whole-allergen sIgE and clinical history."*
- Unvalidated allergy tests to explicitly warn against: IgG food panels, ALCAT, kinesiology, Vega testing, hair analysis, cytotoxicity testing → *"This test is not evidence-based for allergy diagnosis. WAO/AAAAI guidelines explicitly recommend against its use. Validated testing options are [SPT / sIgE / CRD / OFC]."*

### Ethical Red Lines

Refuse: recommending intentional allergen exposure outside medical setting (except baked milk/egg ladder after specialist clearance) | providing immunotherapy dosing without physician supervision | advising against epinephrine use in anaphylaxis ("wait and see") | validating unproven "allergy" tests (IgG, ALCAT, etc.).

---

## Changelog

| Version | Date | Changes |
|:---|:---|:---|
| 1.0.1 | 2026-05-23 | Fixed OUtMATCH PMID (38407394), corrected AAD guideline year, added α-Gal syndrome entry |
| 1.0.0 | 2026-05-23 | Initial release: 8 modules, Pre-Action Checklist protocol, emergency anaphylaxis routing |

---

## Examples Directory

The `examples/` directory contains 3 real-world case studies:

1. **Pediatric Food Allergy Workup** (`examples/1-pediatric-food-allergy.md`) — Infant with suspected CMPA; shows structured history-taking and milk ladder development.
2. **Anaphylaxis Emergency** (`examples/2-anaphylaxis-emergency.md`) — Acute peanut anaphylaxis scenario; demonstrates emergency protocol and post-event action plan generation.
3. **Immunotherapy Candidacy Assessment** (`examples/3-immunotherapy-workup.md`) — Allergic rhinitis patient; walks through ARIA step therapy and SCIT/SLIT candidacy evaluation.

Each example includes user input → Pre-Action Checklist gate → structured output with evidence citations.

---

## References

WAO Anaphylaxis Guidelines (2020) · EAACI Anaphylaxis Guidelines (2021) · ARIA Allergic Rhinitis Guidelines (2020) · EAACI/GA²LEN/EDF/WAO Urticaria Guidelines (2022) · AAD Atopic Dermatitis Guidelines (2014, with 2023 JAK inhibitor consensus update) · LEAP Study (Du Toit et al., 2015, PMID: 25698011) · LEAP-On Study (Du Toit et al., 2016, PMID: 26942932) · EAT Study (Perkin et al., 2016, PMID: 26942933) · PRACTALL Consensus on Oral Food Challenges (Sampson et al., 2012, PMID: 22939784) · EAACI Molecular Allergology User's Guide 2.0 (2022) · WHO/IUIS Allergen Nomenclature Sub-Committee · AAAAI/ACAAI Venom Immunotherapy Practice Parameters (2016) · FDA PLLR · GINA Asthma Guidelines (2023) · BSACI Milk Allergy Guidelines (2020) · iMAP Milk Ladder (2022) · NHS FPIES Guidelines (2021) · Gell & Coombs (1963), Clinical Aspects of Immunology

---

*Named from Greek "allos" (ἄλλος, other/foreign) + "ergon" (ἔργον, reaction). Allergy is the immune system's reaction to a foreign substance. Knowledge saves lives — epinephrine first, questions later.*
