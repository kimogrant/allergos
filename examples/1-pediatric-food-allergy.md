# Example 1: Pediatric Food Allergy Workup

## Scenario
**User Input**: "My 6-month-old son has been having blood in his stools for the past month. He's exclusively breastfed. I've noticed it happens more after I eat dairy. Could this be cow's milk protein allergy? What should I do?"

## Agent Response

### Step 1: Pre-Action Checklist Gate

**Allergy History Gate** — Confirm before taking history:

- [✅] Patient age (and sex if relevant to certain allergies) → 6-month-old male
- [✅] Suspected allergen(s) or trigger(s) specified → dairy (cow's milk)
- [✅] Primary symptom(s) described (skin / respiratory / GI / cardiovascular / multi-system) → GI: blood in stools
- [✅] Timing: onset after exposure and duration of symptoms → 1 month duration, pattern after maternal dairy intake
- [✅] Setting: community / clinic / emergency → community
- [✅] History type specified (initial assessment / follow-up / pre-immunotherapy workup) → initial assessment

All items checked → Proceed to structured history.

### Step 2: Structured Allergy History & Classification

```
**Allergy History**

**Patient**: 6-month-old male
**Date**: 2026-05-23
**Referral Reason**: suspected cow's milk protein allergy (CMPA) with blood-streaked stools

---

**Index Reaction** (most severe or most recent reaction):

| Domain | Details |
|:---|:---|
| Allergen | Cow's milk protein (via breast milk) |
| Route of exposure | Ingestion (via breast milk) |
| Amount / dose | Unknown maternal dairy intake |
| Time to onset | Hours to days after maternal consumption |
| Duration | Chronic over 1 month |
| Symptoms | Blood-streaked stools, no vomiting/diarrhea, no skin/respiratory symptoms |
| Setting | Home |
| Activity at time | Normal feeding |
| Treatment given | None |
| Response to treatment | N/A |
| Cofactors present | None identified |

**Symptom-by-System Assessment**:

| System | Symptoms Present? |
|:---|:---|
| Skin/Mucosal | No urticaria, angioedema, eczema flare |
| Upper Respiratory | No rhinorrhea, nasal congestion, sneezing |
| Lower Respiratory | No cough, wheeze, dyspnea |
| GI | **Yes** — blood-streaked stools (hematochezia) |
| Cardiovascular | No tachycardia, hypotension, syncope |
| Neurological | No anxiety, confusion, loss of consciousness |

**Number of organ systems involved**: 1 (GI only) → **Not anaphylaxis**

---

**Allergy Chronology**:

| Date / Age | Allergen | Reaction | Severity | Confirmed? |
|:---|:---|:---|:---:|:---:|
| 5–6 months | Cow's milk (via breast milk) | Blood-streaked stools | Mild | Clinical Hx only |

---

**Hypersensitivity Classification**:

This presentation is most consistent with **non-IgE-mediated cow's milk protein allergy (CMPA)**:

- Delayed onset (hours to days) after exposure
- GI symptoms only (hematochezia)
- No immediate skin or respiratory symptoms
- No evidence of IgE-mediated mechanism

**Gell & Coombs Type**: Likely **Type IVb (Th2-driven delayed hypersensitivity)** or mixed mechanism.

**Severity Grade**: Grade 1 (Mild) — single organ (GI) involvement only.

---

**Differential Diagnosis**:
1. Cow's milk protein allergy (CMPA) — most likely
2. Soy protein allergy (via breast milk) — less likely
3. Infectious colitis (bacterial/viral) — less likely given chronicity
4. Intussusception — would have more severe pain, "red currant jelly" stools
5. Meckel's diverticulum — usually painless, can be chronic
6. Anal fissure — visible on exam, usually painful

---

**Next Steps**:

1. **Maternal elimination diet**: Remove all cow's milk, butter, cheese, yogurt, whey, casein from mother's diet for 2–4 weeks.
2. **Monitor response**: Stool blood should resolve within 1–2 weeks if CMPA.
3. **Calcium supplementation**: Mother needs 1000–1200 mg calcium/day while eliminating dairy.
4. **No formula change needed** (exclusively breastfed).
5. **Reintroduction challenge**: After 4 weeks elimination, mother reintroduces dairy while monitoring infant's stools. If blood recurs, confirms CMPA.
6. **Referral**: Consider pediatric gastroenterology/allergy referral for confirmation.

**Evidence Level**: Level II (BSACI Milk Allergy Guidelines 2020, PMID: 32000309)
```

---

### Step 3: Diagnostic Reasoning (if SPT/sIgE were requested)

```
**Diagnostic Gate** — Confirm before interpreting tests:

- [✅] Suspected allergen(s) clearly specified → cow's milk
- [✅] Clinical history of reaction (timing, symptoms, severity) provided → delayed GI, blood in stools
- [ ] Test type specified (SPT / sIgE / CRD / OFC / patch test) → **MISSING**
- [ ] Test results with units and reference ranges provided (for lab-based tests) → **MISSING**
- [✅] Patient age specified (pediatric reference ranges differ) → 6 months
- [ ] Medications that could interfere with SPT documented → **MISSING**

**Agent Response**: "I need the test type (SPT / sIgE / CRD) and results with reference ranges before I can interpret these test results. Also, has the infant been on any antihistamines in the past 7 days?"

---

**If user provides**: "SPT: cow's milk wheal 2 mm, histamine control 5 mm, saline control 0 mm. No antihistamines."

**Interpretation**:

```
**Skin Prick Test Results**

**Date**: [date of test]
**Antihistamines withheld?**: Yes, ≥7 days
**Positive control (histamine)**: 5 mm (valid test)
**Negative control (saline/glycerin)**: 0 mm

| Allergen | Wheal (mm) | Flare (mm) | Interpretation |
|:---|:---:|:---:|:---|
| Cow's milk | 2 | 5 | **Negative** (<3 mm > negative control) |

**Interpretation Notes**:
- Negative SPT supports **non-IgE-mediated CMPA** (delayed, GI-only symptoms).
- Non-IgE-mediated CMPA accounts for ~60% of CMPA cases in infants.
- Negative SPT does NOT rule out CMPA — clinical history is key.
- Management remains the same: maternal elimination diet.

**Evidence**: BSACI Milk Allergy Guidelines 2020: negative SPT in 50–70% of non-IgE CMPA (PMID: 32000309).
```

---

### Step 4: Management Plan & Milk Ladder Development

```
**Cow's Milk Protein Allergy (CMPA) Management Plan**

Based on the clinical picture (delayed GI symptoms, negative SPT), this is **non-IgE-mediated CMPA**.

**Immediate Management**:
1. **Maternal elimination diet**: Remove all cow's milk products for 4 weeks.
2. **Calcium supplementation**: Mother needs 1000–1200 mg calcium/day (dairy-free sources: fortified plant milks, leafy greens, supplements).
3. **Monitor infant**: Stool blood should resolve within 1–2 weeks. If no improvement, consider soy elimination (10–14% co-allergy).
4. **No need for formula** (exclusively breastfed).

**Reintroduction Challenge** (after 4 weeks elimination):
- Mother reintroduces dairy (e.g., 1 glass of milk).
- Monitor infant's stools for 72 hours.
- If blood recurs → confirms CMPA → continue elimination.
- If no reaction → CMPA unlikely → resume normal diet.

**Prognosis**:
- Non-IgE CMPA has excellent prognosis: ~90% outgrow by age 3.
- Resolution typically occurs by 12–24 months.

**Milk Ladder Planning** (for future, at ~12–18 months):

**⚠️ Do NOT attempt milk ladder at home if**:
- History of anaphylaxis (not applicable here)
- Poorly controlled asthma (not applicable)
- Positive SPT to cow's milk (not applicable — SPT negative)
- Bos d 8 (casein) sIgE >50 kUa/L (not tested)

**Milk Ladder** — 12-Step Graduated Introduction (MAP Guideline):

Proceed to next step ONLY if current step tolerated for ≥7 days without reaction.

| Step | Food | Milk Protein (approx.) | Notes |
|:---:|:---|:---:|:---|
| 1 | Malted milk biscuit (e.g., Malteser candy) | Trace (<5 mg) | Start here at 12–18 months under pediatrician guidance |
| 2 | Muffin/brownie containing milk | ~50 mg | Heavily baked matrix |
| 3 | Cookie/biscuit with milk | ~100 mg | Baked but lower temperature |
| ... | ... | ... | ... |
| 12 | Fresh cow's milk | ~8 g (240 mL) | Final tolerance assessment |

**Baked Milk Tolerance Significance**: ~70% of milk-allergic children tolerate extensively heated (baked) milk. Baked milk tolerance is a favorable prognostic marker.

**Follow-up**:
- Pediatric allergy referral at 12 months for formal assessment.
- Consider component testing (Bos d 8/casein) if CMPA persists beyond 2 years.

**Evidence**: BSACI Milk Allergy Guidelines 2020, iMAP Milk Ladder 2022 (PMID: 32000309, PMID: 35213790).
```

---

### Step 5: Safety Boundaries & Emergency Routing

```
**Safety Disclaimer**: This content is AI-generated for allergy education and clinical reference only. All medical decisions must be reviewed by a board-certified allergist/immunologist. In case of suspected anaphylaxis, administer epinephrine immediately and call emergency services (911 / 999 / 112). This does not constitute medical advice.

**Emergency Recognition** — This case does NOT show anaphylaxis features:
- No respiratory symptoms (wheezing, stridor, difficulty breathing)
- No cardiovascular symptoms (dizziness, hypotension, collapse)
- No multi-system involvement
- No immediate reaction after exposure

**If the infant develops**:
- Difficulty breathing, wheezing, or stridor after feeding
- Swelling of lips, tongue, or throat
- Dizziness, pallor, or collapse
- Two or more organ systems involved (e.g., skin rash + vomiting)

→ **ADMINISTER EPINEPHRINE NOW** and **CALL 911** immediately.

**Action Plan** (for future IgE-mediated reactions):
- Discuss with pediatrician about prescribing epinephrine auto-injector (EpiPen Jr 0.15 mg) if any IgE-mediated features emerge.
- Generate formal Food Allergy Emergency Action Plan once diagnosis confirmed.

---

**Summary**:
1. **Most likely**: non-IgE-mediated CMPA
2. **Immediate action**: maternal dairy elimination × 4 weeks
3. **Monitoring**: stool blood resolution within 1–2 weeks
4. **Reintroduction**: after 4 weeks to confirm
5. **Future**: milk ladder at 12–18 months under specialist guidance
6. **Emergency preparedness**: no current epinephrine needed, but monitor for IgE features

**Next appointment**: Pediatrician follow-up in 2 weeks to assess response to elimination.
```

---

## Key Learning Points from This Example

1. **Pre-Action Checklist** ensures all necessary information is gathered before proceeding.
2. **Structured history** organizes information systematically.
3. **Hypersensitivity classification** distinguishes IgE vs. non-IgE mechanisms.
4. **Negative SPT does NOT rule out allergy** in non-IgE-mediated cases.
5. **Management differs by mechanism**: IgE → strict avoidance + epinephrine; non-IgE → elimination + gradual reintroduction.
6. **Milk ladder** is planned for future but NOT initiated until specialist clearance.
7. **Safety boundaries** clearly state when to route to emergency care.
8. **Evidence citations** support all recommendations.

This example demonstrates how Allergos handles a common pediatric allergy scenario with structured reasoning, safety gates, and evidence-based management.