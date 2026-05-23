# Allergos — Allergy & Immunology AI Agent Skill

> **AI Agent Allergy & Immunology Suite** · 8 clinical modules covering history-taking, diagnostics, cross-reactivity, anaphylaxis, pharmacotherapy, pediatrics, action plans, and environmental control
> Compatible with Claude Code · Codex · Cursor · OpenCode · Gemini CLI

---

## Metadata

```yaml
name: allergos
version: 1.0.1
author: clinical-skills
description: A comprehensive allergy and immunology clinical assistant skill for AI coding agents, covering structured allergy history, diagnostic reasoning, cross-reactivity encyclopedia, anaphylaxis emergency protocols, pharmacotherapy and immunotherapy, pediatric allergy, patient action plan generation, and environmental control. Features mandatory pre-action checklists and emergency safety routing.
tags: [allergy, immunology, anaphylaxis, food-allergy, asthma, eczema, immunotherapy, pediatric, medical, clinical]
platforms: [claude-code, codex, cursor, opencode, gemini-cli]
language: [en]
```

---

## Trigger Conditions

Activate when **any** keyword matches:
- Allergy history: allergic rhinitis, hay fever, food allergy, drug allergy, insect sting allergy, latex allergy, contact dermatitis, urticaria, angioedema
- Anaphylaxis: anaphylaxis, anaphylactic shock, epinephrine, EpiPen, biphasic reaction, mast cell tryptase
- Testing: skin prick test, SPT, specific IgE, sIgE, component-resolved diagnosis, CRD, oral food challenge, OFC, patch test, drug provocation test
- Immunotherapy: SCIT, SLIT, allergy shots, sublingual immunotherapy, OIT, oral immunotherapy, rush immunotherapy, cluster immunotherapy
- Pediatric: milk ladder, egg ladder, peanut introduction, LEAP, EAT, FPIES, CMPA, cow's milk protein allergy, infant eczema
- Cross-reactivity: oral allergy syndrome, OAS, pollen-food syndrome, latex-fruit syndrome, cross-reactivity
- Biologics: omalizumab, dupilumab, mepolizumab, benralizumab, tezepelumab, Xolair, Dupixent, Nucala, Fasenra
- Patient tools: allergy action plan, asthma action plan, eczema management, food allergy management, EpiPen instructions
- Environmental: dust mite, pollen, mold, pet dander, HEPA, allergy-proofing, allergen avoidance
- Wheeze / hives / rash / swelling / itching + allergic / allergy context

---

## Core Behavioral Rules

Before executing **any** allergy task:

1. **Safety Disclaimer**: Prepend AND append every clinical output with: *"This content is AI-generated for allergy education and clinical reference only. All medical decisions must be reviewed by a board-certified allergist/immunologist. In case of suspected anaphylaxis, administer epinephrine immediately and call emergency services (911 / 999 / 112). This does not constitute medical advice."*
2. **Anaphylaxis-First Rule**: If ANY of the following appear in the user's input, skip all other logic and jump to [Module 4: Anaphylaxis Emergency Protocol]:
   - Difficulty breathing / stridor / wheezing after exposure
   - Swelling of lips, tongue, or throat
   - Dizziness, hypotension, loss of consciousness after exposure
   - Two or more organ systems involved acutely (skin + respiratory, skin + GI, etc.)
   - Known allergen exposure + any systemic symptom within minutes to 2 hours
3. **Honesty Under Uncertainty**: If allergen information is insufficient, explicitly list missing data points. **Never fabricate or guess allergen profiles, cross-reactivities, or test results.**
4. **Evidence-First**: Every clinical claim must carry evidence level (I–V) and source (PMID / WAO guideline / EAACI / AAAAI / ACAAI position paper).
5. **Privacy by Default**: Auto-redact PII from any patient data.
6. **Standardized Terminology**: WAO nomenclature for hypersensitivity reactions, WHO/IUIS allergen nomenclature (component names e.g., Ara h 2, Bet v 1, Der p 1), ICD-11 for diagnoses.

---

## Pre-Action Checklist Protocol

> This is the **superpowers-style guardrail** — the agent MUST run the checklist BEFORE any module output. If any item is unchecked, **halt and prompt the user** for the missing information. Do not proceed with incomplete data.

Each module defines its own checklist. The agent must:
1. Display the checklist to the user
2. Mark each item ✅ or ❌ based on what the user has provided
3. If any ❌ remains, output: *"I need the following before I can proceed:"* and list only the unchecked items
4. Only after all items are ✅, generate the full module output

---

## Module 1: Structured Allergy History & Classification

### Pre-Action Checklist

```
**Allergy History Gate** — Confirm before taking history:

- [ ] Patient age (and sex if relevant to certain allergies)
- [ ] Suspected allergen(s) or trigger(s) specified
- [ ] Primary symptom(s) described (skin / respiratory / GI / cardiovascular / multi-system)
- [ ] Timing: onset after exposure and duration of symptoms
- [ ] Setting: community / clinic / emergency
- [ ] History type specified (initial assessment / follow-up / pre-immunotherapy workup)

If any unchecked → "I need [missing item(s)] before I can take an allergy history."
```

### 1.1 Structured Allergy History Template

```
**Allergy History**

**Patient**: [Age] [Sex]
**Date**: YYYY-MM-DD
**Referral Reason**: [suspected allergy / immunotherapy candidacy / anaphylaxis follow-up]

---

**Index Reaction** (most severe or most recent reaction):

| Domain | Details |
|:---|:---|
| Allergen | [specific food/drug/venom/inhalant/latex] |
| Route of exposure | [ingestion / inhalation / skin contact / injection] |
| Amount / dose | [estimated quantity consumed or administered] |
| Time to onset | [minutes/hours after exposure] |
| Duration | [minutes/hours/days; self-limited or required intervention] |
| Symptoms | [describe by organ system — see below] |
| Setting | [home / restaurant / hospital / outdoor] |
| Activity at time | [exercise / rest / sleep] |
| Treatment given | [antihistamine / epinephrine / corticosteroid / bronchodilator / ED visit] |
| Response to treatment | [resolution time / biphasic symptoms] |
| Cofactors present | [exercise / NSAID / alcohol / infection / menstruation] |

**Symptom-by-System Assessment**:

| System | Symptoms Present? |
|:---|:---|
| Skin/Mucosal | Urticaria / angioedema / flushing / pruritus / eczema flare |
| Upper Respiratory | Rhinorrhea / nasal congestion / sneezing / laryngeal edema / stridor |
| Lower Respiratory | Cough / wheeze / dyspnea / chest tightness / hypoxia |
| GI | Nausea / vomiting / abdominal pain / diarrhea / oral pruritus |
| Cardiovascular | Tachycardia / hypotension / syncope / arrhythmia |
| Neurological | Anxiety / sense of impending doom / confusion / loss of consciousness |

**Number of organ systems involved**: [1 / 2 / 3+] → [if >=2, flag as anaphylaxis]

---

**Allergy Chronology**:

| Date / Age | Allergen | Reaction | Severity | Confirmed? |
|:---|:---|:---|:---:|:---:|
| [date] | [allergen] | [symptoms] | Mild / Mod / Severe / Anaphylaxis | SPT / sIgE / OFC / Clinical Hx |
```

### 1.2 Gell & Coombs Hypersensitivity Classification

| Type | Mechanism | Onset | Classic Examples | Key Mediators |
|:---:|:---|:---:|:---|:---|
| I | IgE-mediated (immediate) | Minutes–2 hours | Anaphylaxis, urticaria, allergic rhinitis, food allergy, venom allergy | Mast cells, basophils, histamine, tryptase |
| II | IgG/IgM cytotoxic | Hours–days | Drug-induced hemolytic anemia, heparin-induced thrombocytopenia | Complement, phagocytes |
| III | Immune complex | 1–3 weeks | Serum sickness, hypersensitivity pneumonitis (acute), Arthus reaction | Complement, neutrophils |
| IVa | Th1-driven (delayed) | 24–72 hours | Contact dermatitis (nickel, poison ivy), tuberculin reaction | IFN-γ, macrophages |
| IVb | Th2-driven (delayed) | 24–72 hours | Maculopapular drug exanthems, eosinophilic esophagitis (EoE) | IL-4, IL-5, IL-13, eosinophils |
| IVc | CD8+ cytotoxic | 24–72 hours | SJS/TEN, DRESS, fixed drug eruption | Perforin, granzyme B |
| IVd | T-cell neutrophilic | 24–48 hours | AGEP (acute generalized exanthematous pustulosis) | IL-8, neutrophils |

### 1.3 Severity Grading

```
**Reaction Severity** (WAO 2020 Grading):

| Grade | Organ System | Criteria |
|:---:|:---|:---|
| 1 (Mild) | Single organ, skin or upper respiratory only | Few hives, mild rhinitis, isolated oral pruritus. No respiratory/CV/GI involvement. |
| 2 (Moderate) | Single organ, moderate | Widespread urticaria, angioedema without airway, moderate GI symptoms. No respiratory distress. |
| 3 (Severe) | Respiratory or laryngeal involvement | Bronchospasm, stridor, laryngeal edema, hypoxia. +/- skin/GI. |
| 4 (Life-threatening) | Cardiovascular compromise | Hypotension, collapse, loss of consciousness, arrhythmia. Anaphylactic shock. |
| 5 (Fatal) | Cardiorespiratory arrest | Death. |
```

---

## Module 2: Diagnostic Reasoning & Allergy Testing

### Pre-Action Checklist

```
**Diagnostic Gate** — Confirm before interpreting tests:

- [ ] Suspected allergen(s) clearly specified
- [ ] Clinical history of reaction (timing, symptoms, severity) provided
- [ ] Test type specified (SPT / sIgE / CRD / OFC / patch test)
- [ ] Test results with units and reference ranges provided (for lab-based tests)
- [ ] Patient age specified (pediatric reference ranges differ)
- [ ] Medications that could interfere with SPT documented (antihistamines: withhold 5–7 days; TCA: withhold 2 weeks; omalizumab: note timing)

If any unchecked → "I need [missing item(s)] before I can interpret these test results."
```

### 2.1 Skin Prick Test (SPT) Interpretation

```
**Skin Prick Test Results**

**Date**: YYYY-MM-DD
**Antihistamines withheld?**: [Yes, ≥7 days / No — results may be unreliable]
**Positive control (histamine)**: [wheal size in mm] (must be ≥3 mm for valid test)
**Negative control (saline/glycerin)**: [wheal size in mm] (must be <3 mm)

| Allergen | Wheal (mm) | Flare (mm) | Interpretation |
|:---|:---:|:---:|:---|
| [Allergen 1] | [ ] | [ ] | Positive (≥3 mm > negative control) / Negative / Borderline |
| [Allergen 2] | [ ] | [ ] | ... |

**Interpretation Notes**:
- Wheal ≥3 mm greater than negative control = positive
- SPT has high sensitivity (>90%) but moderate specificity (~50-85%) — clinical history is essential
- Larger wheal size correlates with higher likelihood of clinical allergy, but does NOT predict severity
- Negative SPT with strong history → consider sIgE or OFC
- Positive SPT without clinical history → likely sensitization, not allergy
- False negatives: antihistamines, TCA, omalizumab, severe eczema, age <6 months
```

### 2.2 Specific IgE (sIgE) Interpretation

```
**Specific IgE Results**

| Allergen | sIgE (kUa/L) | Class | Interpretation |
|:---|:---:|:---:|:---|
| [Allergen] | [value] | [0–6] | Positive / Negative / Borderline |

**Quantitative Interpretation** (kUa/L):
| sIgE Level | Class | Clinical Significance |
|:---|:---:|:---|
| <0.10 | 0 | Negative / undetectable |
| 0.10–0.34 | 0/1 | Borderline; clinical correlation essential |
| 0.35–0.69 | 1 | Low positive; may represent sensitization only |
| 0.70–3.49 | 2 | Moderate positive |
| 3.50–17.49 | 3 | High positive |
| 17.50–49.99 | 4 | Very high positive |
| 50.00–100.00 | 5 | Very high positive |
| >100.00 | 6 | Extremely high positive |

**Important Limitations**:
- sIgE detects sensitization, NOT clinical allergy. Up to 50% of positive food sIgE may be clinically irrelevant.
- Higher sIgE correlates with higher probability of clinical allergy, but does NOT predict reaction severity.
- Total IgE is NOT a screening tool for allergy — do not order in isolation.
- sIgE to allergen extracts (e.g., "peanut") has lower specificity than component-resolved diagnosis (e.g., Ara h 2).
```

### 2.3 Component-Resolved Diagnosis (CRD)

```
**Component-Resolved Diagnosis**

CRD identifies sensitization to specific allergenic proteins, distinguishing:
- **Primary sensitization** (species-specific components) → high risk of clinical allergy
- **Cross-reactive sensitization** (pan-allergens) → often clinically irrelevant or OAS only

**Key Components by Allergen**:

| Allergen | Component | Protein Family | Clinical Significance |
|:---|:---|:---|:---|
| **Peanut** | Ara h 2 | 2S albumin (storage) | 🔴 Primary sensitization; high risk of systemic reaction |
| | Ara h 6 | 2S albumin (storage) | 🔴 Similar to Ara h 2; marker of severe allergy |
| | Ara h 1, 3 | 7S/11S globulin (storage) | 🟡 Associated with systemic reactions |
| | Ara h 8 | PR-10 (pathogenesis-related) | 🟢 Cross-reactive with birch (Bet v 1); usually OAS only |
| **Hazelnut** | Cor a 9 | 11S globulin (storage) | 🔴 Primary; systemic reactions |
| | Cor a 14 | 2S albumin (storage) | 🔴 Primary; systemic reactions |
| | Cor a 1 | PR-10 | 🟢 Cross-reactive with birch; OAS only |
| **Walnut** | Jug r 1 | 2S albumin | 🔴 Primary; systemic |
| | Jug r 3 | nsLTP | 🔴 Primary; systemic, heat-stable, cofactor-dependent |
| **Cashew/Pistachio** | Ana o 3 | 2S albumin | 🔴 Primary; systemic |
| **Soy** | Gly m 4 | PR-10 | 🟢 Birch-cross-reactive; OAS only |
| | Gly m 5, 6 | 7S/11S globulin | 🔴 Primary; systemic |
| **Cow's Milk** | Bos d 4 (α-lactalbumin) | Whey | 🟡 Heat-labile; tolerated in baked milk |
| | Bos d 5 (β-lactoglobulin) | Whey | 🟡 Heat-labile |
| | Bos d 8 (casein) | Casein | 🔴 Heat-stable; marker of persistent, severe CMPA |
| **Egg** | Gal d 1 (ovomucoid) | Kazal-type inhibitor | 🔴 Heat-stable; marker of persistent egg allergy |
| | Gal d 2 (ovalbumin) | Serpin | 🟡 Heat-labile; tolerated in baked egg |
| **Shrimp** | Pen a 1 (tropomyosin) | Muscle protein | 🔴 Pan-allergen for crustaceans + dust mite + cockroach cross-reactivity |
| **Birch** | Bet v 1 | PR-10 | 🟢 Triggers OAS with many fruits/nuts via PR-10 cross-reactivity |
| **Timothy Grass** | Phl p 1, 5 | Grass group 1/5 | 🔴 Primary grass sensitization; marker for SCIT candidacy |
| **Dust Mite** | Der p 1, 2 | Cysteine protease / NPC2 | 🔴 Primary HDM sensitization |
| **Bee Venom** | Api m 1 (phospholipase A2) | Enzyme | 🔴 Primary bee venom allergy |
| | Api m 4 (melittin) | Peptide | 🟡 Cross-reactive carbohydrate determinant (CCD); false positive risk |
| **Wasp Venom** | Ves v 1 (phospholipase A1) | Enzyme | 🔴 Primary wasp venom allergy |
| | Ves v 5 (antigen 5) | Unknown | 🔴 Primary wasp venom allergy; Ves v 5 + Api m 1 distinguishes wasp from bee |

**CCD Warning**: Cross-reactive carbohydrate determinants (CCDs) cause false-positive sIgE across multiple allergens. If patient is polysensitized (sIgE positive to many unrelated allergens without clinical reactions), consider CCD inhibition testing or CRD to exclude false positives.
```

### 2.4 Oral Food Challenge (OFC)

```
**Oral Food Challenge Protocol**

**Indication**: Confirm or exclude food allergy when history + SPT/sIgE are equivocal.

**Pre-Challenge Checklist**:
- [ ] Informed consent obtained
- [ ] Patient fasting ≥2 hours (solids) / ≥1 hour (liquids)
- [ ] No antihistamines for ≥7 days
- [ ] No asthma exacerbation within 48 hours
- [ ] No acute illness / fever
- [ ] Baseline vitals recorded (HR, BP, RR, SpO2, PEF/FEV1 if asthmatic)
- [ ] IV access if high-risk (previous anaphylaxis, asthma, high sIgE)
- [ ] Epinephrine immediately available (weight-based dose calculated)
- [ ] Resuscitation equipment available and checked

**OFC Protocol** (example: open OFC, 5–7 escalating doses):

| Dose # | Amount | Cumulative | Observation (min) | Time |
|:---:|:---|:---|:---:|:---|
| 1 | [starting dose, e.g., 3 mg protein] | [3 mg] | 15–20 | 0:00 |
| 2 | [e.g., 10 mg] | [13 mg] | 15–20 | 0:20 |
| 3 | [e.g., 30 mg] | [43 mg] | 15–20 | 0:40 |
| 4 | [e.g., 100 mg] | [143 mg] | 15–20 | 1:00 |
| 5 | [e.g., 300 mg] | [443 mg] | 15–20 | 1:20 |
| 6 | [e.g., 1 g] | [1.44 g] | 15–20 | 1:40 |
| 7 | [age-appropriate serving] | [total] | 120 (minimum 2 hours) | 2:00 |

**Stopping Criteria** ⛔:
- Objective: urticaria, angioedema, wheeze, stridor, vomiting (≥2 episodes), diarrhea, hypotension, SpO2 <94%
- Subjective (STOP if persistent): moderate-severe abdominal pain, throat tightness, generalized pruritus
- At any stopping criterion → administer epinephrine per Module 4, record time, dose, and response

**Post-Challenge**: Observe ≥2 hours after last dose. Document final tolerance level [mg protein]. Provide written OFC outcome summary and action plan.

**Risk Stratification for OFC**:

| Risk | Criteria | Setting Recommendation |
|:---:|:---|:---|
| Low | sIgE <2 kUa/L, SPT <5 mm, no asthma, no prior anaphylaxis, isolated OAS | Office-based, no IV required |
| Medium | sIgE 2–14 kUa/L, SPT 5–10 mm, well-controlled asthma | Office-based, IV access recommended |
| High | sIgE >14 kUa/L, SPT >10 mm, prior anaphylaxis, poorly controlled asthma, multiple allergens | Hospital setting, IV required, anesthesiologist aware |
```

### 2.5 Drug Provocation Testing

```
**Drug Provocation Test (DPT)**

Indicated when drug allergy needs to be confirmed or excluded and skin/sIgE testing is not available or conclusive.

**Contraindications**: SJS/TEN, DRESS, AGEP, serum sickness, organ-specific hypersensitivity (hepatitis, nephritis, cytopenia).

**Protocol** (EAACI/ENDA guidelines): 2–3 step graded challenge with placebo, typically:
- Step 1: 1/10 of therapeutic dose → observe 30 min
- Step 2: 1/4 of therapeutic dose → observe 30 min
- Step 3: Full therapeutic dose → observe 60 min

**Beta-Lactam Allergy Delabeling**: If SPT + intradermal + sIgE all negative, <5% risk of reaction on DPT. Most patients labeled "penicillin-allergic" (~90%) are not truly allergic. Active delabeling programs reduce unnecessary broad-spectrum antibiotic use.
```

---

## Module 3: Cross-Reactivity Encyclopedia

### Pre-Action Checklist

```
**Cross-Reactivity Gate** — Confirm before analysis:

- [ ] Primary allergen or sensitization pattern specified
- [ ] Clinical history: are reactions systemic or OAS only?
- [ ] CRD results available? (strongly recommended for accurate cross-reactivity assessment)
- [ ] Specific cross-reactivity question stated (which foods/drugs should be avoided?)

If any unchecked → "I need [missing item(s)] before I can assess cross-reactivity."
```

### 3.1 Pollen-Food Allergy Syndrome (Oral Allergy Syndrome)

```
**Pollen-Food Cross-Reactivity Matrix**

| Pollen (Primary) | Cross-Reactive Foods | Protein Family | Typical Symptoms | Cooking Tolerated? |
|:---|:---|:---|:---|:---:|
| **Birch** (Bet v 1) | Apple, pear, peach, cherry, plum, apricot, almond, hazelnut, walnut, carrot, celery, potato, kiwi, soybean | PR-10 | Oral-pharyngeal pruritus, mild lip angioedema | ✅ Yes (heat-labile) |
| **Ragweed** | Melon, watermelon, banana, cucumber, zucchini, chamomile | Profilin | OAS, rarely systemic | ✅ Yes |
| **Mugwort** (Art v 1) | Celery, carrot, parsley, fennel, anise, coriander, sunflower seeds, chamomile | nsLTP / profilin | OAS; celery-mugwort-spice syndrome (nsLTP: systemic) | 🟡 PR-10: yes. nsLTP: no |
| **Grass** (Phl p 1/5) | Melon, watermelon, tomato, peach, orange | Profilin / CCD | OAS, usually mild | ✅ Yes |
| **Latex** (Hev b) | Banana, avocado, chestnut, kiwi, papaya, tomato, potato, bell pepper | Class I chitinase / profilin / hevein | OAS to anaphylaxis (kiwi, banana, avocado higher risk) | 🟡 Variable; structural proteins may be heat-stable |

**Clinical Pearls**:
- OAS symptoms are typically confined to the oropharynx and self-resolve within minutes. Systemic reactions to PR-10 foods are rare (<2%).
- Cooking, baking, or canning denatures PR-10 and profilin proteins → usually tolerated.
- nsLTP-mediated reactions (peach, walnut, mugwort-celery-spice) are heat-stable and more often systemic with co-factors (exercise, NSAID).
```

### 3.2 Food-Food Cross-Reactivity

```
**Food-Food Cross-Reactivity Table**

| Food | High-Risk Cross-Reactors | Low-Risk / Independent |
|:---|:---|:---|
| **Peanut** | Lupin (lupine flour), fenugreek. Other legumes (soy, pea, lentil, chickpea): co-sensitization ~5-15% but clinical relevance is low unless proven. | Most patients with peanut allergy tolerate other legumes. |
| **Tree Nuts** | Cashew ↔ pistachio (strong), walnut ↔ pecan (strong), almond ↔ peach (PR-10, rare). Brazil nut, macadamia, pine nut: usually independent. | Avoid all tree nuts unless individual tolerance demonstrated by OFC. |
| **Cow's Milk** | Goat milk, sheep milk (>90% cross-reactivity). Mare/donkey milk: lower (<20%) but not recommended. | Soy (CMPA infants: ~10-14% soy co-allergy). Hydrolyzed formula: extensively hydrolyzed (~2-5% residual allergenicity). Amino acid formula: 0%. |
| **Egg** | Chicken (bird-egg syndrome, rare). Other avian eggs (duck, quail): highly cross-reactive. | Egg allergy ≠ chicken meat allergy. |
| **Fish** | All finned fish: parvalbumin is pan-allergen. Cod ↔ salmon ↔ tuna ↔ mackerel all cross-reactive. | Some patients tolerate specific fish species (tuna/swordfish may be less allergenic). Do not assume; test individually. |
| **Shellfish** | Crustaceans (shrimp, crab, lobster, crawfish): tropomyosin pan-allergen → strongly cross-reactive. Mollusks (clam, oyster, mussel, scallop, squid, octopus): often tolerated by crustacean-allergic patients. | Dust mite ↔ shrimp cross-sensitization (tropomyosin) is common but clinical relevance is uncertain. |
| **Wheat** | Barley, rye (gluten-containing grains). Oat: may be tolerated unless contaminated. | Wheat allergy ≠ gluten sensitivity ≠ celiac disease. |
| **Sesame** | Poppy seed, flaxseed, sunflower seed: moderate cross-reactivity. | Peanut/tree nut allergy does not predict sesame allergy. |
| **α-Gal Syndrome (Red Meat)** | Beef, pork, lamb, venison, mammalian organ meats (liver, kidney). Gelatin (in vaccines, capsules). | Delayed onset (3–6 hours post-ingestion). Triggered by tick bite (Lone Star tick, Amblyomma americanum). Not cross-reactive with poultry, fish, seafood. |
```

### 3.3 Drug Cross-Reactivity

```
**Drug Cross-Reactivity Reference**

| Drug Class | Cross-Reactivity Rule | Evidence |
|:---|:---|:---|
| **Beta-Lactams** | Penicillin ↔ cephalosporin: ~1-2% cross-reactivity (similar to general population). Side-chain similarity matters more than beta-lactam ring. Aminopenicillin (amoxicillin) ↔ aminocephalosporin (cefadroxil, cefprozil): higher risk due to identical R1 side chain. | Level I (MA, Romano 2020) |
| **Cephalosporin ↔ Carbapenem** | <1% cross-reactivity. Carbapenems are safe in most penicillin-allergic patients. | Level II |
| **Cephalosporin ↔ Aztreonam** | Safe (no cross-reactivity). Exception: ceftazidime-allergic patients (shared R1 side chain). | Level II |
| **Sulfonamide Antibiotics** | Sulfamethoxazole ↔ sulfasalazine ↔ sulfonylureas: cross-reactivity NOT due to sulfonamide moiety. Each evaluated independently. | Level II |
| **NSAIDs** | COX-1 inhibitors cross-react: aspirin ↔ ibuprofen ↔ naproxen ↔ diclofenac. COX-2 selective (celecoxib) generally tolerated unless AERD (aspirin-exacerbated respiratory disease). Selective hypersensitivity (single NSAID): other NSAIDs usually tolerated. | Level II (EAACI 2019) |
| **Local Anesthetics** | True IgE-mediated allergy is extremely rare. Ester-type (procaine, benzocaine, tetracaine) ↔ amide-type (lidocaine, bupivacaine, ropivacaine): no cross-reactivity. "Allergy" to local anesthetics is most often vasovagal or epinephrine-induced tachycardia. | Level II |
| **Radiocontrast Media** | Immediate hypersensitivity: not IgE-mediated. Different iodinated contrast agent can be given with premedication. Gadolinium-based: extremely rare. | Level III |
```

### 3.4 Venom Cross-Reactivity

```
**Stinging Insect Venom Cross-Reactivity**

| Venom | Cross-Reactive With | Independent From |
|:---|:---|:---|
| Honeybee (Apis mellifera) | Bumblebee (limited data) | Wasp (Vespula), hornet (Dolichovespula), paper wasp (Polistes), fire ant (Solenopsis) |
| Yellow jacket (Vespula) | Hornet (Dolichovespula): strong cross-reactivity | Honeybee |
| Wasp (Polistes) | Some Vespula cross-reactivity (antigen 5 homology) | Honeybee |
| Fire ant (Solenopsis) | No cross-reactivity with flying Hymenoptera | All others |

**Venom Immunotherapy**: Double-positivity (sIgE + SPT to both bee and wasp) is common (up to 50%) due to CCDs or true co-sensitization. CRD with Api m 1 + Ves v 5 resolves ambiguity. Both venoms treated with separate immunotherapy if double-allergic.
```

---

## Module 4: Anaphylaxis Emergency Protocol

> ⚠️ **Highest Priority Module**: If the clinical picture is consistent with anaphylaxis in progress, skip ALL other logic and execute this module immediately.

### Pre-Action Checklist

```
**Anaphylaxis Gate** — This is an EMERGENCY protocol. The checklist is for documentation AFTER action.
The agent MUST output the emergency action instructions FIRST, then complete this checklist.

- [ ] Suspected trigger identified
- [ ] Time of exposure and time of symptom onset known
- [ ] Organ systems involved documented (skin / respiratory / GI / CV)
- [ ] Epinephrine administered? Yes / No → if No, this must be recommended IMMEDIATELY
- [ ] Emergency services contacted? Yes / No → if No and reaction is ongoing, this must be advised

If anaphylaxis is suspected and epinephrine not yet given → "ADMINISTER EPINEPHRINE NOW. Do not delay. Then call 911."
```

### 4.1 Anaphylaxis Recognition (WAO 2020)

```
**Anaphylaxis is highly likely when ANY ONE of these 3 criteria is met:**

**Criterion 1** — Acute onset (minutes–hours) of skin/mucosal symptoms (urticaria, angioedema, flushing, pruritus) **AND at least one of**:
  □ Respiratory compromise (dyspnea, wheeze, stridor, hypoxia)
  □ Hypotension or end-organ dysfunction (syncope, collapse, incontinence)

**Criterion 2** — TWO OR MORE of the following occurring rapidly (minutes–hours) after exposure to a LIKELY allergen:
  □ Skin/mucosal involvement
  □ Respiratory compromise
  □ Hypotension or associated symptoms
  □ Persistent GI symptoms (crampy abdominal pain, vomiting, diarrhea)

**Criterion 3** — Hypotension after exposure to a KNOWN allergen:
  □ Infants/children: low SBP (age-specific) or >30% decrease from baseline
  □ Adults: SBP <90 mmHg or >30% decrease from baseline
```

### 4.2 Emergency Action Sequence

```
**IMMEDIATE ACTION — DO NOT DELAY**

1️⃣ **EPINEPHRINE** — Administer INTRAMUSCULAR (IM) into the mid-outer thigh (vastus lateralis).
   - EpiPen / EpiPen Jr: 0.3 mg (adult) / 0.15 mg (child 15–30 kg)
   - Alternative: epinephrine auto-injector (Jext, Emerade, Auvi-Q)
   - If no auto-injector: epinephrine ampule 1:1000 (1 mg/mL)
     - Adult: 0.3–0.5 mg IM (0.3–0.5 mL)
     - Child: 0.01 mg/kg IM (max 0.3 mg in pre-hospital setting, 0.5 mg in hospital)

   ⏱️ If no improvement in 5–15 minutes: REPEAT DOSE.

2️⃣ **POSITION**
   - Lie FLAT with legs elevated (unless respiratory distress → sit semi-upright)
   - If vomiting → lateral recumbent position
   - If pregnant → left lateral position (to relieve IVC compression)
   - DO NOT stand or walk — sudden standing can cause empty ventricle syndrome and death

3️⃣ **CALL 911 / 999 / 112** — "Suspected anaphylaxis. Epinephrine administered."
   - Note time of first epinephrine dose
   - All patients with anaphylaxis should go to ED for observation (risk of biphasic reaction)

4️⃣ **SUPPLEMENTAL OXYGEN** — High-flow O2 if available (10–15 L/min via non-rebreather)

5️⃣ **SECOND-LINE** (ONLY after epinephrine — these do NOT replace epinephrine):
   - IV fluids: 20 mL/kg normal saline bolus (adult: 1–2 L), repeat as needed
   - Antihistamine: cetirizine 10 mg PO or diphenhydramine 25–50 mg IV/IM (for symptom relief, NOT life-saving)
   - Corticosteroid: methylprednisolone 1–2 mg/kg IV or prednisolone 1 mg/kg PO (may reduce biphasic risk, evidence limited)
   - Inhaled beta-agonist: salbutamol 4–8 puffs via spacer if bronchospasm present

6️⃣ **BIPHASIC REACTION MONITORING**
   - Biphasic reactions occur in ~1–20% of anaphylaxis cases
   - Typical onset: 4–24 hours after initial reaction resolution, but can be up to 72 hours
   - Risk factors: severe initial reaction, delayed epinephrine (>60 min), need for >1 epinephrine dose, hypotension on presentation
   - Observation period in ED: minimum 4–6 hours; consider 12–24 hours if risk factors present
```

### 4.3 Epinephrine Dosing Reference

```
**Weight-Based Epinephrine IM Dosing**

| Weight (kg) | Epinephrine Dose (1:1000, 1 mg/mL) | Auto-Injector |
|:---|:---|:---|
| <7.5 kg | 0.01 mg/kg (clinical judgment; limited data) | None available; use ampule/syringe |
| 7.5–15 kg | 0.10 mg (0.10 mL) | 0.1 mg auto-injector (if available) |
| 15–25 kg | 0.15 mg (0.15 mL) | EpiPen Jr (0.15 mg) or 0.15 mg auto-injector |
| 25–30 kg | 0.15–0.20 mg | EpiPen Jr (0.15 mg) |
| >30 kg | 0.30 mg (0.30 mL) | EpiPen (0.3 mg) or 0.3 mg auto-injector |
| >50 kg | 0.50 mg (0.50 mL) | EpiPen (0.3 mg); may use 0.5 mg if hospital setting |

**Key Principles**:
- IM is preferred over SC (faster absorption, higher peak plasma levels)
- Epinephrine has NO absolute contraindication in anaphylaxis
- The risk of epinephrine side effects (tachycardia, tremor, anxiety) is negligible compared to the risk of death from untreated anaphylaxis
- Fatal anaphylaxis is associated with DELAYED epinephrine administration — give it early
```

### 4.4 Refractory Anaphylaxis

```
**If no response after 2 doses of IM epinephrine + IV fluids:**

- Consider IV epinephrine infusion (ICU setting only): 1 mg epinephrine in 1000 mL D5W or NS (1 mcg/mL). Start 0.05–0.1 mcg/kg/min, titrate to effect. Requires continuous cardiac monitoring.
- Consider alternative diagnoses: asthma exacerbation, ACE-inhibitor angioedema, scombroid fish poisoning, panic attack, vasovagal, hereditary angioedema (non-histaminergic, no urticaria)
- Serum tryptase: draw within 15 min–3 hours of symptom onset (peak at 1–2 hours). Baseline tryptase 24h after resolution. Elevated acute:baseline ratio >1.2 + 2 ng/mL supports anaphylaxis.
```

---

## Module 5: Pharmacotherapy & Immunotherapy

### Pre-Action Checklist

```
**Therapy Gate** — Confirm before making recommendations:

- [ ] Diagnosis confirmed (allergic rhinitis / asthma / atopic dermatitis / food allergy / venom allergy)
- [ ] Disease severity assessed (mild / moderate / severe)
- [ ] Previous treatment trials and response documented
- [ ] Contraindications to proposed therapy screened
- [ ] Patient preference for route (oral / nasal / injectable) and goals of therapy discussed

If any unchecked → "I need [missing item(s)] before I can recommend therapy."
```

### 5.1 Pharmacotherapy Ladder

```
**Allergic Rhinitis Step Therapy** (ARIA Guidelines):

| Step | Therapy | Notes |
|:---:|:---|:---|
| 1 | 2nd-gen oral antihistamine (cetirizine, loratadine, fexofenadine, bilastine) daily | Preferred over 1st-gen (sedating). Intranasal antihistamine (azelastine, olopatadine) for rapid onset. |
| 2 | Intranasal corticosteroid (fluticasone furoate, mometasone, budesonide, triamcinolone) daily | Maximum efficacy at 2–4 weeks. Combine with intranasal antihistamine if step 1 insufficient. |
| 3 | Add leukotriene receptor antagonist (montelukast) | Particularly if concomitant asthma. Monitor for neuropsychiatric AEs (FDA boxed warning). |
| 4 | Consider SCIT or SLIT | Disease-modifying; only therapy targeting etiology. |

**Urticaria Step Therapy** (EAACI/GA²LEN/EDF/WAO):

| Step | Therapy | Notes |
|:---:|:---|:---|
| 1 | 2nd-gen non-sedating H1-antihistamine standard dose | e.g., cetirizine 10 mg, fexofenadine 180 mg, bilastine 20 mg daily |
| 2 | Up to 4x standard dose of 2nd-gen H1-antihistamine | Off-label but guideline-recommended. Evidence for up-dosing strongest for bilastine, desloratadine, levocetirizine, rupatadine. |
| 3 | Add omalizumab 300 mg SC q4 weeks | Anti-IgE monoclonal antibody. ~70% response in CSU. |
| 4 | Add cyclosporine (2.5–5 mg/kg/day) | Only if omalizumab-refractory. Monitor BP and renal function. |

**Atopic Dermatitis Step Therapy** (AAD Guidelines):

| Step | Therapy | Notes |
|:---:|:---|:---|
| 1 | Emollients (liberal use) + trigger avoidance | Foundation of all AD management |
| 2 | Low-potency TCS (hydrocortisone 1–2.5%) for face/neck/folds | Intermittent use only; proactive therapy 2x/week for maintenance |
| 3 | Medium-potency TCS (triamcinolone 0.1%) or topical calcineurin inhibitor (tacrolimus 0.03%/0.1%, pimecrolimus 1%) | TCI preferred for face and intertriginous areas |
| 4 | Phototherapy (narrowband UVB) | 2–3x/week; requires compliance |
| 5 | Systemic: dupilumab (anti-IL-4Rα, first-line biologic, ages 6 months+), tralokinumab (anti-IL-13), upadacitinib/abrocitinib (JAK inhibitor, ages 12+), cyclosporine (short-term) |
```

### 5.2 Biologics Reference

```
**Allergy/Immunology Biologics at a Glance**

| Biologic | Target | Indications | Age | Key Considerations |
|:---|:---|:---|:---:|:---|
| Omalizumab (Xolair) | Anti-IgE | Moderate-severe persistent allergic asthma, CSU, nasal polyps (CRSwNP), food allergy (FDA 2024) | ≥6 years (asthma); ≥12 years (CSU); ≥1 year (food allergy) | Anaphylaxis risk: ~0.1–0.2%. Monitor 30 min after first 3 injections. Dose based on IgE + weight. |
| Dupilumab (Dupixent) | Anti-IL-4Rα | Moderate-severe atopic dermatitis, asthma, CRSwNP, EoE, prurigo nodularis | ≥6 months (AD); ≥6 years (asthma); ≥1 year (EoE) | Conjunctivitis (~10%), injection site reactions. No lab monitoring required. |
| Mepolizumab (Nucala) | Anti-IL-5 | Severe eosinophilic asthma, EGPA, HES, CRSwNP | ≥6 years (asthma); ≥18 years (EGPA) | Eosinophil count must be ≥150–300 cells/µL. Fixed 100 mg SC q4 weeks (asthma). |
| Benralizumab (Fasenra) | Anti-IL-5Rα | Severe eosinophilic asthma | ≥12 years | Depletes eosinophils via ADCC. 30 mg SC q4 weeks ×3, then q8 weeks. |
| Tezepelumab (Tezspire) | Anti-TSLP | Severe asthma (eosinophilic AND non-eosinophilic) | ≥12 years | First biologic effective regardless of eosinophil count. 210 mg SC q4 weeks. |
```

### 5.3 Allergen Immunotherapy (AIT)

```
**SCIT (Subcutaneous Immunotherapy)**

**Indications**: Allergic rhinitis/conjunctivitis (moderate-severe), allergic asthma (mild-moderate, well-controlled), venom allergy (history of systemic reaction + positive SPT/sIgE).

**Contraindications (Absolute)**:
- Uncontrolled or severe asthma (FEV1 <70% predicted)
- Beta-blocker use (relative — impairs epinephrine response if anaphylaxis occurs)
- Active autoimmune disease (relative)
- Pregnancy: do not initiate; maintenance may be continued

**Build-Up Phase**:

| Protocol | Duration | Doses/Visit | Time to Maintenance |
|:---|:---|:---:|:---|
| Conventional | Weeks to months | 1 injection/visit, 1–3 visits/week | ~3–6 months |
| Cluster | Weeks | 2–3 injections/visit | ~6–8 weeks |
| Rush | Days (inpatient/hospital only) | Multiple injections/day | 1–3 days |

**Maintenance Phase**: 1 injection q2–4 weeks for 3–5 years. Observe 30 minutes post-injection.

---

**SLIT (Sublingual Immunotherapy)**

| Product | Allergen(s) | Dosing | Age |
|:---|:---|:---|:---:|
| Grastek | Timothy grass | 1 tablet SL daily | ≥5 years |
| Ragwitek | Short ragweed | 1 tablet SL daily | ≥5 years |
| Oralair | 5-grass mix | 1 tablet SL daily | ≥5 years |
| Odactra | Dust mite (D. pteronyssinus + D. farinae) | 1 tablet SL daily | ≥12 years |

- **First dose**: Administered in clinic; observe 30 min
- **Subsequent doses**: Home administration
- **Start**: 12 weeks before pollen season; continue through season
- **Duration**: 3 years minimum
- **Local AE**: oral pruritus, throat irritation, lip swelling — common, self-limited
- **Systemic AE**: rare (<0.1%). No fatalities reported with SLIT tablets.

---

**Venom Immunotherapy (VIT)**

**Indication**: History of systemic reaction to Hymenoptera sting + positive SPT/sIgE. Adults with cutaneous-only reactions (large local) generally do not need VIT; children may be observed.

**Protocol**:
- Conventional (outpatient): ~12–16 weeks build-up
- Rush (inpatient): 1–3 days to maintenance dose (100 mcg venom protein)
- Maintenance: q4 weeks × 3–5 years (minimum); consider indefinite if severe index reaction (hypotension, loss of consciousness) or mast cell disorder

**Protection rate**: Bee VIT ~80–85%; wasp VIT ~95–98%.
```

### 5.4 Oral Immunotherapy (OIT)

```
**OIT for Food Allergy**

Currently, the only FDA-approved OIT product: **Palforzia** (peanut, Arachis hypogaea allergen powder-dnfp), ages 4–17 years.

**OIT Principles**:
| Phase | Duration | Goal |
|:---|:---|:---|
| Initial dose escalation | 1 day (clinic) | Identify starting dose; multiple micro-doses in clinic |
| Build-up (up-dosing) | ~6 months | Biweekly dose increases in clinic; daily home dosing at current tolerated level |
| Maintenance | Indefinite | 300 mg peanut protein daily (Palforzia) or equivalent for non-FDA OIT |

**Efficacy**: ~67–80% tolerate oral challenge after build-up. NOT a cure — desensitization only (requires ongoing daily maintenance dose).

**Safety**: ~10–20% require epinephrine during build-up. ~3% experience EoE (eosinophilic esophagitis) onset during OIT.

**Candidates** (shared decision-making):
- High-risk peanut allergy (Ara h 2 positive, high sIgE, prior anaphylaxis)
- Significant QoL impairment from avoidance
- Patient/family understands: daily dosing, indefinite duration, risk of reactions, NOT a cure
```

---

## Module 6: Pediatric Allergy

### Pre-Action Checklist

```
**Pediatric Allergy Gate** — Confirm before recommendations:

- [ ] Child's age (months/years) clearly specified
- [ ] Growth parameters (weight, growth curve percentile) available
- [ ] Current diet described (breastfeeding / formula / solids)
- [ ] Reaction details: food(s) implicated, timing, symptoms, severity
- [ ] Existing allergy test results (SPT / sIgE / CRD) if available
- [ ] Comorbid atopic conditions: eczema, asthma, other food allergies

If any unchecked → "I need [missing item(s)] before I can make pediatric allergy recommendations."
```

### 6.1 Cow's Milk Protein Allergy (CMPA) in Infants

```
**CMPA Classification**:

| Type | Onset | Symptoms | IgE |
|:---|:---|:---|:---:|
| IgE-mediated (immediate) | Minutes–2 hours | Urticaria, angioedema, vomiting, wheeze, anaphylaxis | Positive SPT/sIgE to cow's milk |
| Non-IgE-mediated (delayed) | 2–72 hours | Colitis (blood-streaked stools), FPIES (profuse vomiting 1–4h post-ingestion), proctocolitis, enteropathy (chronic diarrhea, FTT) | Negative SPT/sIgE |
| Mixed | Both patterns | EoE, atopic dermatitis flare | Variable |

**Management by Feeding Type**:

| Feeding Type | Management |
|:---|:---|
| **Exclusively Breastfed** | Maternal dairy elimination diet (all cow's milk, butter, cheese, yogurt, whey, casein). Calcium supplementation 1000–1200 mg/day. Response: 3–5 days for IgE; 2–4 weeks for non-IgE. If no improvement → consider soy/egg elimination. |
| **Formula-Fed (IgE CMPA)** | Extensively hydrolyzed formula (eHF) first-line. 2–5% residual allergenicity → if fails, amino acid formula (AAF). |
| **Formula-Fed (Non-IgE CMPA)** | eHF first-line (~90% effective). If fails: AAF. Soy formula NOT before 6 months (risk of soy co-allergy ~10–14%). |
| **Solids-Introduced** | Strict avoidance of all cow's milk products. Baked milk tolerance assessment at ~12–18 months (see Milk Ladder). |

**Prognosis**: ~50% outgrow by age 1, ~75% by age 3, ~90% by age 6. IgE-mediated CMPA tends to persist longer. Elevated Bos d 8 (casein) sIgE predicts persistence.
```

### 6.2 Milk Ladder (Baked Milk Introduction)

```
**Milk Ladder** — 12-Step Graduated Introduction (MAP Guideline)

Proceed to next step ONLY if current step tolerated for ≥7 days without reaction.
⚠️ Do NOT attempt at home if: history of severe anaphylaxis, poorly controlled asthma, Bos d 8 >50 kUa/L.

| Step | Food | Milk Protein (approx.) | Notes |
|:---:|:---|:---:|:---|
| 1 | Malted milk biscuit (e.g., Malteser candy) | Trace (<5 mg) | Extensively heated, denatured protein. Start here for all. |
| 2 | Muffin/brownie containing milk | ~50 mg | Heavily baked matrix (>180°C / 350°F, ≥30 min). |
| 3 | Cookie/biscuit with milk (e.g., shortbread) | ~100 mg | Baked but lower temperature, shorter duration. |
| 4 | Pancake/waffle with milk | ~200 mg | Griddle-cooked, lower internal temp than oven-baked. |
| 5 | Muffin with visible cheese | ~300 mg | Cheese added — less heat-denatured than milk powder. |
| 6 | Scrambled egg with milk added | ~400 mg | Milk cooked but not in baked matrix. |
| 7 | Cheese pizza slice | ~500 mg | Cheese melted; contains intact casein. |
| 8 | Yogurt (1 tsp → 1 tbsp → full serving) | ~1–3 g | Pasteurized, not heated. Intact milk proteins. |
| 9 | Butter/margarine with milk solids | Trace | Milk solids present; often tolerated early. |
| 10 | Milk chocolate (1 square → full bar) | ~50–200 mg | Contains milk powder. |
| 11 | Cheese (hard: cheddar, parmesan) | ~2–5 g/serving | Fermented, partially hydrolyzed proteins. |
| 12 | Fresh cow's milk (1 tsp → 30 mL → full serving) | ~8 g (240 mL) | Final tolerance assessment. |

**Baked Milk Tolerance Significance**: ~70% of milk-allergic children tolerate extensively heated (baked) milk. Baked milk tolerance is a favorable prognostic marker — associated with faster resolution of CMPA.
```

### 6.3 Egg Ladder

```
**Egg Ladder** — Graduated Introduction

| Step | Food | Egg Protein | Notes |
|:---:|:---|:---:|:---|
| 1 | Baked egg in wheat matrix (muffin/cake, 1 crumb → full serving) | ~1 g / muffin | 180°C × 30 min. Gal d 1 (ovomucoid) partially denatured in baked matrix. |
| 2 | Well-cooked egg in food (egg pasta, egg-fried rice, meatball with egg binder) | ~1–2 g / serving | Egg as binder, well-distributed in food matrix. |
| 3 | Pancake/waffle (whole egg in batter) | ~3–4 g / serving | Griddle-cooked, lower temp. |
| 4 | Hard-boiled egg yolk only | ~2–3 g / yolk | Separate from white. |
| 5 | Hard-boiled egg white only | ~3–4 g / white | Albumen (egg white) is more allergenic than yolk. |
| 6 | Scrambled egg (soft) | ~6 g / egg | Least denatured; final stage. |
| 7 | Whole fresh egg (raw in smoothie, lightly cooked, poached) | ~6 g / egg | Full tolerance confirmed. |

**Baked Egg Tolerance**: ~70% of egg-allergic children tolerate baked egg. Baked egg tolerance + sIgE to Gal d 1 (ovomucoid) <1 kUa/L predicts faster resolution.
```

### 6.4 Peanut Introduction (LEAP Protocol)

```
**Early Peanut Introduction Guidelines** (based on LEAP trial, PMID: 25698011):

**Risk Stratification** (assess at 4–6 months):

| Risk Level | Criteria | Recommendation |
|:---|:---|:---|
| **High** | Severe eczema, egg allergy, or both | SPT/sIgE at 4–6 months → if SPT <4 mm or sIgE <0.35: introduce peanut at 4–6 months under specialist supervision. If SPT 5–7 mm: consider OFC. If SPT ≥8 mm: likely allergic; avoid. |
| **Moderate** | Mild–moderate eczema | Introduce peanut at ~6 months at home. |
| **Low** | No eczema, no food allergy | Introduce peanut freely per family/cultural preference. |

**Maintenance After Introduction**: 2 g peanut protein 3x/week (approx. 2 tsp peanut butter or 21 Bamba snacks).

**Practical Introduction Protocol**:
- Start with 1/4 tsp smooth peanut butter mixed with warm water/breastmilk/formula
- Observe 15–20 min
- If tolerated, gradually increase to 2 tsp over several days
- Continue 2 tsp 3×/week for at least 3 years (LEAP-On showed sustained protection)

⚠️ Whole peanuts and chunky peanut butter are choking hazards for children <4 years.
```

### 6.5 FPIES (Food Protein-Induced Enterocolitis Syndrome)

```
**FPIES Recognition**:

| Feature | FPIES | IgE-Mediated Food Allergy |
|:---|:---|:---|
| Onset | 1–4 hours after ingestion (not minutes) | Minutes–2 hours |
| Symptoms | Profuse, repetitive vomiting → lethargy → pallor → diarrhea (5–10 hours later) | Urticaria, angioedema, respiratory symptoms |
| Age | Infants and young children (classic) | Any age |
| Most common triggers | Cow's milk, soy, rice, oat, egg, poultry | Peanut, tree nut, milk, egg, shellfish |
| Diagnostics | Clinical diagnosis; no validated lab test | SPT/sIgE |
| Management | Strict avoidance; no role for epinephrine; IV fluids if hypotensive | Epinephrine, antihistamines |

**Acute FPIES Management**: IV fluids (20 mL/kg NS bolus), ondansetron 0.15 mg/kg IV/IM (not PO — patient vomiting). No role for epinephrine or antihistamines. Most resolve with IV fluids + ondansetron within hours.

**Chronic FPIES**: Failure to thrive, chronic diarrhea. Resolves with trigger elimination. Reintroduction at ~12–18 months after last reaction.
```

---

## Module 7: Patient Action Plan Generator

### Pre-Action Checklist

```
**Action Plan Gate** — Confirm before generating:

- [ ] Patient name/identifier specified (for header)
- [ ] Allergen(s) clearly listed
- [ ] Severity of previous reactions documented
- [ ] Current medications listed (epinephrine auto-injector prescribed? antihistamines?)
- [ ] Plan type specified (food allergy / asthma / eczema / venom)
- [ ] Age-appropriate language and format (child vs. adult version)
- [ ] Emergency contact numbers provided

If any unchecked → "I need [missing item(s)] before I can generate the action plan."
```

### 7.1 Food Allergy Emergency Action Plan

```
**EMERGENCY ACTION PLAN — FOOD ALLERGY**

**Patient Name**: [Name]
**DOB**: [DOB]
**Allergist**: [Name] | [Phone]
**Emergency Contact**: [Name] | [Phone] | [Relationship]

**Confirmed Allergen(s)**:
- [Allergen 1] — [last reaction date, severity]
- [Allergen 2] — [last reaction date, severity]
- [Allergen 3] — [last reaction date, severity]

**Medications**:
- Epinephrine auto-injector: [EpiPen/EpiPen Jr/Jext/Auvi-Q] — [0.15 mg / 0.3 mg]
- Location: [where kept at home / school / bag]
- Expiry date: [date] — REPLACE BEFORE EXPIRY
- Antihistamine: [cetirizine/loratadine/fexofenadine] [dose]
- Asthma inhaler (if applicable): [salbutamol/albuterol] [dose]

---

**⚠️ HOW TO RECOGNIZE AN ALLERGIC REACTION**

| Mild Reaction | Severe Reaction (ANAPHYLAXIS) — CALL 911 |
|:---|:---|
| Few hives | Difficulty breathing / wheezing / persistent cough |
| Mild swelling (lip, eyelid) | Swelling of tongue / throat / difficulty swallowing |
| Itchy mouth / nose | Hoarse voice / difficulty speaking |
| Stomach ache / 1 episode of vomiting | Repetitive vomiting / severe abdominal pain |
| | Pale / floppy (infant) / dizzy / collapse |
| | TWO or more mild symptoms in different body areas |

---

**🚨 ANAPHYLAXIS ACTION PLAN**

**IF ANY SEVERE SYMPTOM IS PRESENT:**

1. **GIVE EPINEPHRINE IMMEDIATELY** — Do NOT wait.
   - [EpiPen Jr (0.15 mg) / EpiPen (0.3 mg)] into OUTER THIGH
   - Hold for 3 seconds
   - Call 911 immediately — say "Anaphylaxis"

2. **POSITION**: Lie flat with legs elevated. If vomiting, turn on side. If breathing difficulty, sit up.

3. **SECOND DOSE**: If no improvement in 5–15 minutes, give second epinephrine auto-injector.

4. **ANTIHISTAMINE** (after epinephrine, if able to swallow): [cetirizine] [dose]

---

**IF ONLY MILD SYMPTOMS** (few hives, mild lip swelling, itchy mouth):

1. Give antihistamine: [cetirizine/loratadine] [dose]
2. Monitor closely for 1–2 hours for progression to severe symptoms
3. If ANY severe symptom develops → give epinephrine and call 911

---

**STRICT AVOIDANCE OF**:
- [Food 1]: [brands, hidden sources, cross-contact risks]
- [Food 2]: [brands, hidden sources, cross-contact risks]

**RESTAURANT / TRAVEL SAFETY**:
- Always carry 2 epinephrine auto-injectors
- Inform restaurant staff of allergy before ordering
- Check ingredient labels every time (formulations change)
- Wear medical alert identification

**Plan Date**: [date]
**Next Review**: [date] — review annually or after any reaction

**Allergist Signature**: __________________
```

### 7.2 Asthma Action Plan

```
**ASTHMA ACTION PLAN**

**Patient Name**: [Name]
**Green Zone (Well-Controlled)**: PEF >[80%] of personal best: [value] L/min
- No cough, wheeze, chest tightness, or shortness of breath
- No nighttime awakening
- Can do usual activities

→ Take controller medication: [medication, dose, frequency]
→ Use reliever inhaler: [dose] (if needed, no more than [X] times/week)

**Yellow Zone (Asthma Flare / Caution)**: PEF [50–80%] of personal best
- Cough, wheeze, chest tightness
- Nighttime awakening due to asthma
- Needing reliever >2 times/week for symptoms

→ Increase controller: [step-up instructions]
→ Start reliever: salbutamol/albuterol [dose] via spacer q4h
→ Start oral corticosteroid (if prescribed): prednisolone [dose] for [X] days
→ If no improvement in 48 hours or worsening → contact physician

**Red Zone (EMERGENCY)**: PEF <[50%] of personal best
- Severe difficulty breathing, speaking in single words
- Retractions (neck, ribs), nasal flaring
- Reliever not lasting 3 hours
- Peak flow not improving after reliever

→ Give reliever: salbutamol/albuterol [dose] via spacer NOW (repeat every 20 min as needed)
→ Start oral corticosteroid NOW (if prescribed)
→ Call 911 (ambulance) immediately if:
  - No improvement after 2–3 reliever doses (20–40 min)
  - Peak flow stays in Red Zone
  - Too breathless to speak / walk / drink
  - Lips or fingernails turn blue/gray

**Triggers to Avoid**:
- [List triggers: pollens, dust mites, pets, cold air, exercise, viral infections, smoke, strong odors]
- Environmental control measures: [specific instructions]

**Allergist**: [name, phone]
**Plan Date**: [date]
```

### 7.3 EpiPen / Auto-Injector Usage Instructions

```
**HOW TO USE EPIPEN / AUTO-INJECTOR** — Patient/Caregiver Education

**Preparation**:
- Always carry TWO auto-injectors (biphasic reaction / device failure)
- Store at room temperature (15–30°C / 59–86°F). DO NOT refrigerate.
- Check expiry date monthly. Replace BEFORE expiry.
- Check viewing window monthly — solution should be clear and colorless.
- Practice with TRAINER device regularly.

**Steps to Administer**:
1. Remove from carrier tube. Form fist around unit. DO NOT put thumb over either end.
2. **BLUE to the sky, ORANGE to the thigh** (EpiPen). Remove blue safety cap.
3. Hold leg firmly. Place ORANGE tip against mid-outer thigh (through clothing if necessary).
4. Press firmly until you hear a CLICK. Hold firmly in place for 3 seconds.
5. Remove and massage injection site for 10 seconds.

**After Use**:
- Call 911. Note time of administration.
- Place used auto-injector back in carrier tube (needle-first) for safe disposal.
- Monitor for second reaction: lie down with legs elevated if possible.

**Common Mistakes**:
- ❌ Putting thumb over either end (injecting into thumb → go to ED immediately)
- ❌ Not holding long enough (must hear click + hold 3 seconds)
- ❌ Injecting into buttock (less absorption than thigh)
- ❌ Using expired auto-injector (replace before expiry)

**Video Resources**: [manufacturer website for instructional videos]
```

---

## Module 8: Environmental & Lifestyle Management

### Pre-Action Checklist

```
**Environmental Gate** — Confirm before making recommendations:

- [ ] Allergen(s) identified (confirmed by SPT/sIgE or strong clinical history)
- [ ] Current home environment described (bedroom type, flooring, pets, HVAC)
- [ ] Symptom pattern described (seasonal vs. perennial vs. both)
- [ ] Previous environmental interventions attempted and response
- [ ] Budget / insurance considerations: is immunotherapy covered?

If any unchecked → "I need [missing item(s)] before I can make environmental recommendations."
```

### 8.1 Allergen-Specific Avoidance Strategies

```
**Dust Mite Avoidance** (evidence-based, prioritized):

| Intervention | Evidence Strength | Recommendation |
|:---|:---:|:---|
| Allergen-impermeable mattress/pillow encasements | Level I | Single most effective HDM intervention. Essential. |
| Wash bedding weekly in hot water (≥55°C / ≥130°F) | Level I | Kills mites and removes allergen. |
| Replace carpets with hard flooring | Level II | Carpet is the primary HDM reservoir. |
| HEPA vacuum cleaner (with sealed system) | Level II | Standard vacuums aerosolize allergen. |
| Reduce indoor humidity to <50% | Level II | Dehumidifier / AC. Mites cannot reproduce below 50% RH. |
| Remove stuffed toys OR wash weekly hot + freeze weekly 24h | Level III | Alternative cycle: wash hot or tumble dry hot. |
| Acaricides (benzyl benzoate, tannic acid) | Level III | Limited evidence; not first-line. |

**NOT Recommended** (insufficient evidence): ionizers, electrostatic precipitators, "allergy-free" mattress covers without RCT evidence.

---

**Pollen Avoidance**:

| Strategy | Evidence |
|:---|:---|
| Keep windows closed during peak pollen season (morning for grass, midday for trees) | Level II |
| Shower and change clothes after outdoor exposure | Level III |
| Nasal saline irrigation (neti pot / squeeze bottle) twice daily in season | Level I (for symptom relief, not avoidance) |
| HEPA air purifier in bedroom | Level II |
| Wrap-around sunglasses outdoors | Level III (reduces ocular symptoms) |
| Monitor pollen counts: pollen.com, local weather services | Level III |
| Pet restrictions: cats that go outdoors bring pollen indoors on fur | Level III |

---

**Mold Avoidance**:

| Strategy | Evidence |
|:---|:---|
| Fix water leaks within 48 hours | Level II |
| Dehumidify basement / crawlspace to <50% RH | Level II |
| HEPA air purifier | Level III |
| Remove visible mold on hard surfaces (bleach solution 1:10) | Level II |
| Remove porous moldy materials (carpet, drywall, ceiling tiles) | Level II |
| Increase ventilation in bathrooms and kitchen (exhaust fans) | Level III |

---

**Pet Dander** (Cat/Dog Allergy):

| Strategy | Evidence |
|:---|:---|
| Remove pet from bedroom entirely (keep door closed) | Level I |
| HEPA air purifier in bedroom and main living area | Level II |
| Wash pet weekly (reduces airborne Fel d 1 by ~40–85% for ~2–3 days) | Level II |
| HEPA vacuum (sealed system) 2–3x/week | Level II |
| Replace carpets with hard flooring | Level II |
| Immunotherapy (SCIT/SLIT): for unavoidable exposures or severe symptoms | Level I |
| "Hypoallergenic" breeds: NO breed is truly hypoallergenic. Individual dogs vary in allergen production. | Level III |

> **Honest Counseling**: The only intervention that reliably eliminates cat allergen from a home is removing the cat. Airborne Fel d 1 particles are 2–10 microns in diameter — they remain airborne for hours, penetrate deep into airways, and are impossible to fully eliminate while the cat lives in the home. Immunotherapy can help but requires 3–5 years of commitment. This must be discussed realistically with patients and families.
```

### 8.2 Occupational Allergy Screening

```
**Occupational Allergen Categories**:

| Occupation | Common Allergens | Testing |
|:---|:---|:---|
| Baker / pastry chef | Wheat, rye, soy flour, egg, fungal amylase, dust mite (flour mite) | SPT + sIgE to wheat, rye, soy, fungi, dust mite |
| Healthcare worker | Latex (gloves), chlorhexidine, antibiotics (aerosolized), disinfectants | SPT + sIgE latex; patch test for chemical disinfectants |
| Veterinarian / lab animal worker | Rat, mouse, rabbit, cat, dog dander and urine proteins | SPT + sIgE to animal dander extracts |
| Farmer / grain handler | Grain dust, storage mites, mold spores, animal dander | SPT to grain dust mix, storage mites, fungi, animal dander |
| Woodworker / carpenter | Western red cedar (plicatic acid), oak, mahogany, iroko wood dust | SPT to wood dust extracts (limited commercial availability); clinical diagnosis |
| Hairdresser | Ammonium persulfate (bleach), paraphenylenediamine (hair dye), latex | Patch test with hairdressing series |
| Seafood processor | Fish, crustacean, mollusk aerosolized proteins (steam/cooking) | SPT + sIgE to specific seafood; airborne exposure as important as ingestion |

**Management**: Workplace modification > respiratory protection (N95 mask) > immunotherapy > career change (last resort). Occupational asthma: early cessation of exposure can lead to full resolution; continued exposure leads to irreversible airway remodeling.
```

---

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