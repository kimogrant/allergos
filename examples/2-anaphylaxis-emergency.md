# Example 2: Anaphylaxis Emergency

## Scenario
**User Input**: "I just ate a Thai curry with peanuts and now my throat feels tight and I'm getting hives all over my body. It's been 15 minutes since I ate. What should I do?"

## Agent Response

### Step 1: Emergency Recognition — Immediate

```
⚠️ The symptoms described are consistent with a potential ANAPHYLACTIC REACTION — a life-threatening medical emergency.

AI cannot triage or treat. ADMINISTER EPINEPHRINE NOW into the outer thigh and CALL 911 (or 112) IMMEDIATELY. Do not delay. Every minute matters.

Trigger Analysis:
  - Known allergen exposure: peanut (Thai curry) ✅
  - Acute onset (<2 hours) ✅
  - Skin involvement: hives ✅
  - Respiratory involvement: throat tightness ✅
  - TWO organ systems involved ✅ → Meets WAO Criterion 2 for anaphylaxis

REQUIRED ACTIONS (in this order):
```

### Step 2: Emergency Action Protocol — Module 4.2 Output

```
🚨 **IMMEDIATE ACTION — DO NOT DELAY**

1️⃣ **EPINEPHRINE** — Administer INTRAMUSCULAR (IM) into the mid-outer thigh NOW.
   - If EpiPen available: 0.3 mg IM (press orange tip to outer thigh, hold 3 seconds)
   - If no auto-injector: seek emergency medical help immediately
   - ⏱️ If no improvement in 5–15 minutes: REPEAT DOSE with second auto-injector

2️⃣ **POSITION**
   - Lie FLAT with legs elevated
   - DO NOT stand or walk — this can cause empty ventricle syndrome and collapse

3️⃣ **CALL 911** — "Suspected anaphylaxis. Epinephrine administered."
   - Note time of first epinephrine dose
   - You MUST go to ED for observation (risk of biphasic reaction)

4️⃣ **IF AVAILABLE** (only after epinephrine):
   - Cetirizine 10 mg PO (if able to swallow) — for symptom relief, NOT life-saving
   - If you have a second auto-injector, keep it ready

---

⚠️ CRITICAL FACTS:
- Epinephrine has NO absolute contraindication in anaphylaxis
- The risk of epinephrine side effects (tachycardia, tremor) is negligible vs. risk of death
- Fatal anaphylaxis is associated with DELAYED epinephrine — give it EARLY
- Antihistamines and corticosteroids do NOT replace epinephrine

---

📞 Call 911 NOW. Time matters.
```

### Step 3: Anaphylaxis Criteria Check

```
**Anaphylaxis Confirmed** (WAO 2020):

**Criterion 2 met** — TWO OR MORE of the following occurring rapidly (minutes–hours) after exposure to a LIKELY allergen:

  ✅ Skin/mucosal involvement: hives all over body
  ✅ Respiratory compromise: throat tightness
  ✅ Known allergen exposure: peanut in Thai curry
  ✅ Time: 15 minutes after ingestion

**Severity**: Grade 3 (Severe) — respiratory involvement with skin symptoms.
```

### Step 4: Post-Acute Phase (After User Reports Epinephrine Given + 911 Called)

Assume the user confirms epinephrine administered and 911 called.

```
**Post-Epinephrine Management**:

1. **Continue monitoring** — remain lying flat with legs elevated until paramedics arrive.
2. **Time tracking**:
   - Time of exposure: [Thai curry consumption time]
   - Time of symptom onset: [user-reported time]
   - Time of first epinephrine dose: [NOW]
3. **Second dose preparation**: If no improvement in 5–15 minutes, administer second auto-injector.
4. **ED arrival**: Inform ED staff of peanut allergy, epinephrine given, time of administration.

**Biphasic Reaction Risk**:
- Biphasic reactions occur in ~1–20% of cases
- Onset: typically 4–24 hours after initial resolution
- You will be monitored in ED for at least 4–6 hours
- Do NOT leave ED against medical advice

**ED Management (for ED staff information)**:
- IV access: 2 large-bore IV lines
- IV fluids: 20 mL/kg normal saline bolus (1–2 L for adult), repeat as needed
- Methylprednisolone 1–2 mg/kg IV (may reduce biphasic risk)
- Diphenhydramine 25–50 mg IV/IM (for persistent urticaria)
- Admission for observation if: required >1 epinephrine dose, hypotension, or prior severe reactions
```

### Step 5: Post-Event Action Plan Generation

After ED discharge and clinical stability:

```
**EMERGENCY ACTION PLAN — FOOD ALLERGY**

**Patient Name**: [Name]
**DOB**: [DOB]
**Allergist**: [Referral to be made]
**Emergency Contact**: [Name] | [Phone]

**Confirmed Allergen(s)**:
- Peanut — anaphylaxis (2026-05-23). Ingestion of peanut in Thai curry → urticaria + throat tightness within 15 minutes. Treated with epinephrine 0.3 mg IM × 1, transported to ED.

**Medications**:
- Epinephrine auto-injector: EpiPen 0.3 mg × 2 (always carry TWO)
- Location: [bag / car / work / home]
- Expiry date: [date] — REPLACE BEFORE EXPIRY
- Antihistamine: cetirizine 10 mg PO (for mild symptoms only)
- Asthma inhaler: [if applicable]

---

**⚠️ HOW TO RECOGNIZE AN ALLERGIC REACTION**

| Mild Reaction | Severe Reaction (ANAPHYLAXIS) — CALL 911 |
|:---|:---|
| Few hives | Difficulty breathing / wheezing / persistent cough |
| Mild swelling (lip, eyelid) | Swelling of tongue / throat / difficulty swallowing |
| Itchy mouth / nose | Throat tightness / hoarse voice |
| Stomach ache / 1 episode of vomiting | Repetitive vomiting / severe abdominal pain |
| | Dizziness / collapse / confusion |
| | TWO or more mild symptoms in different body areas |

---

**🚨 ANAPHYLAXIS ACTION PLAN**

**IF ANY SEVERE SYMPTOM IS PRESENT:**

1. **GIVE EPINEPHRINE IMMEDIATELY** — Do NOT wait.
   - EpiPen (0.3 mg) into OUTER THIGH
   - Hold for 3 seconds
   - Call 911 — say "Anaphylaxis"

2. **POSITION**: Lie flat with legs elevated. If vomiting, turn on side. If breathing difficulty, sit up.

3. **SECOND DOSE**: If no improvement in 5–15 minutes, give second EpiPen.

4. **CALL 911**: Even if symptoms improve. State "Anaphylaxis, epinephrine given."

---

**IF ONLY MILD SYMPTOMS** (few hives, mild lip swelling, itchy mouth):

1. Give cetirizine 10 mg PO
2. Monitor closely for 1–2 hours for progression
3. If ANY severe symptom develops → give epinephrine and call 911

---

**PEANUT AVOIDANCE**:
- **Hidden sources**: Asian cuisine (Thai, Chinese, Indian, Vietnamese), satay, mole sauce, chili, marzipan, nougat, praline, some gravies and salad dressings
- **Cross-contact**: Bakery items, ice cream parlors, buffets, fried foods (shared oil)
- **Label reading**: Always check "Contains: peanut" and "May contain traces of peanut"
- **Restaurants**: Inform staff of peanut allergy before ordering. Ask about cooking oils (peanut oil may be used).
- **Air travel**: Notify airline in advance. Wipe tray table + armrests. Consider peanut-free buffer zone.

**INTERNATIONAL TRAVEL**:
- Thai: ถั่วลิสง (thua lisong) — peanut
- Chinese: 花生 (huāshēng) — peanut
- Japanese: ピーナッツ (pīnattsu) — peanut
- French: cacahuète / arachide
- Spanish: cacahuete / maní
- Always carry translation card

**Plan Date**: 2026-05-23
**Next Review**: 2027-05-23

---

**Next Steps After Discharge**:
1. Schedule appointment with board-certified allergist (within 2–4 weeks)
2. Confirmation testing: SPT + sIgE to peanut + CRD (Ara h 2, Ara h 6, Ara h 8)
3. Discuss oral immunotherapy (OIT) candidacy for desensitization
4. Ensure 2 epinephrine auto-injectors prescribed
5. Family/caregiver education on auto-injector use (practice with trainer device)
6. Medical alert identification (bracelet/necklace)
7. School/work food allergy action plan (individualized)
```

### Step 6: Long-Term Management — Immunotherapy Consideration

```
**Peanut Allergy Management Options**:

| Option | Description | Efficacy | Considerations |
|:---|:---|:---:|:---|
| Strict avoidance + 2 auto-injectors | Current standard | N/A (preventative) | High anxiety, social isolation, accidental exposure risk ~3–5%/year |
| Palforzia (FDA-approved OIT) | 300 mg peanut protein daily maintenance | ~67–80% tolerate challenge | Ages 4–17. NOT a cure — desensitization only. ~10–20% require epinephrine during build-up. |
| Sublingual immunotherapy (SLIT) | Peanut SLIT drops | ~40–50% desensitization | Lower side effect profile but lower efficacy than OIT. Investigational. |
| Epicutaneous immunotherapy (EPIT) | Peanut patch (Viaskin) | ~35% response (12 months) | Lowest AE profile. Ages 1–3 promising. Awaiting FDA approval. |
| Omalizumab + OIT | Xolair pretreatment then OIT | Improved safety (fewer reactions) | FDA-approved 2024. Biologic cost may be limiting. |

**CRD-Guided Risk Assessment**:

| Component | sIgE Result | Interpretation |
|:---|:---:|:---|
| Ara h 2 | [test result] | High if >0.35: primary peanut sensitization → high risk of systemic reaction |
| Ara h 6 | [test result] | Similar to Ara h 2 |
| Ara h 8 | [test result] | If positive but Ara h 2/6 negative: likely birch-cross-reactive → OAS only, NOT systemic risk |

**Evidence**: LEAP Study (Du Toit et al., 2015, PMID: 25698011); PALISADE OIT Trial (PALISADE Group, 2018, PMID: 30449234); OUtMATCH Trial (Wood et al., 2024, PMID: 38407394).

---

**Safety Disclaimer**: This content is AI-generated for allergy education and clinical reference only. All medical decisions must be reviewed by a board-certified allergist/immunologist. In case of suspected anaphylaxis, administer epinephrine immediately and call emergency services (911 / 999 / 112). This does not constitute medical advice.
```

---

## Key Learning Points from This Example

1. **Anaphylaxis-first routing** — The agent immediately recognized emergency criteria and skipped all non-emergency logic.
2. **No hesitation on epinephrine** — The output explicitly says "ADMINISTER EPINEPHRINE NOW — Do NOT wait."
3. **Clear, unambiguous language** — Emergency instructions use bold, imperative language. No clinical hedging.
4. **Anaphylaxis criteria checked** — WAO 2020 criteria explicitly referenced to confirm the diagnosis.
5. **Post-acute management** — Biphasic reaction monitoring, ED observation duration, discharge criteria.
6. **Action plan generation** — Comprehensive, personalized food allergy emergency action plan.
7. **Long-term planning** — Immunotherapy options discussed with efficacy and safety data.
8. **CRD risk stratification** — Ara h 2/6 vs. Ara h 8 distinction for personalized risk assessment.
9. **Safety disclaimer** present on every clinical output.
10. **Evidence citations** for all recommendations.

This example demonstrates the highest-priority module in Allergos — emergency anaphylaxis management — and the complete post-event workflow from emergency response through long-term treatment planning.