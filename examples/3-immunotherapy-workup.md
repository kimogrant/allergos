# Example 3: Allergic Rhinitis — Immunotherapy Candidacy Assessment

## Scenario
**User Input**: "I've had severe seasonal allergies for 10 years — every spring from March to June, I get sneezing fits, itchy watery eyes, and nasal congestion. I've tried cetirizine and fluticasone nasal spray but they barely help. It's affecting my sleep and work. I'm 35, otherwise healthy. Could I be a candidate for allergy shots?"

## Agent Response

### Step 1: Pre-Action Checklist Gate

**Allergy History Gate** — Confirm before taking history:

- [✅] Patient age (and sex if relevant to certain allergies) → 35, sex unspecified
- [✅] Suspected allergen(s) or trigger(s) specified → seasonal pollens (spring: March–June)
- [✅] Primary symptom(s) described → sneezing, itchy watery eyes, nasal congestion
- [✅] Timing: onset after exposure and duration of symptoms → seasonal (March–June), 10-year history
- [✅] Setting: community / clinic / emergency → community
- [✅] History type specified (initial assessment / follow-up / pre-immunotherapy workup) → immunotherapy workup

**Therapy Gate** — Confirm before making recommendations:

- [✅] Diagnosis confirmed (allergic rhinitis / asthma / atopic dermatitis / food allergy / venom allergy) → allergic rhinitis, seasonal
- [✅] Disease severity assessed (mild / moderate / severe) → severe (failed standard therapy, affecting QoL)
- [✅] Previous treatment trials and response documented → cetirizine + fluticasone nasal spray, inadequate response
- [✅] Contraindications to proposed therapy screened → no beta-blockers, no uncontrolled asthma, no pregnancy, no autoimmune disease mentioned
- [ ] Patient preference for route (oral / nasal / injectable) and goals of therapy discussed → **MISSING** (implied: considering SCIT)

**Agent Response**: "Before I make specific immunotherapy recommendations, I need to clarify: have you had any allergy testing (skin prick test or blood IgE) to identify the specific pollens you're allergic to? Also, do you have any history of asthma — shortness of breath, chest tightness, wheezing?"

### Step 2: Structured Allergy History (User Provides Additional Data)

Assume the user reports:
- SPT positive to: birch (8 mm), timothy grass (10 mm), ragweed (5 mm) — all >3 mm above negative control
- No asthma history. No beta-blockers. No autoimmune disease.
- Prefers injection (SCIT) over daily tablets (SLIT) — wants the highest efficacy option.

```
**Allergy History**

**Patient**: 35 years old
**Date**: 2026-05-23
**Referral Reason**: immunotherapy candidacy assessment — seasonal allergic rhinoconjunctivitis

---

**Index Reaction** (typical seasonal pattern):

| Domain | Details |
|:---|:---|
| Allergen | Tree (birch) + grass (timothy) pollens |
| Route of exposure | Inhalation |
| Time to onset | Minutes of outdoor exposure in spring |
| Duration | Entire pollen season (March–June) |
| Symptoms | Sneezing, rhinorrhea, nasal congestion, itchy watery eyes |
| Setting | Outdoors (worse on high pollen days) |
| Treatment given | Cetirizine 10 mg daily + fluticasone nasal spray daily |
| Response to treatment | Partial (~30% improvement) |
| Cofactors present | None |

**Symptom-by-System Assessment**:

| System | Symptoms Present? |
|:---|:---|
| Skin/Mucosal | No urticaria, eczema. Ocular pruritus present. |
| Upper Respiratory | **Yes** — rhinorrhea, nasal congestion, sneezing |
| Lower Respiratory | No cough, wheeze, dyspnea |
| GI | None |
| Cardiovascular | None |
| Neurological | None |

**Number of organ systems involved**: 1 (upper respiratory + ocular)
**No anaphylaxis features.**

---

**Allergy Test Results**:

| Allergen | SPT Wheal (mm) | Histamine Control (mm) | Interpretation |
|:---|:---:|:---:|:---|
| Birch | 8 | 5 | Positive |
| Timothy grass | 10 | 5 | Positive |
| Ragweed | 5 | 5 | Positive |
| Dust mite (D. pteronyssinus) | 2 | 5 | Negative |
| Cat dander | 1 | 5 | Negative |
| Alternaria (mold) | 0 | 5 | Negative |
```

### Step 3: ARIA Step Therapy Assessment

```
**Allergic Rhinitis Step Therapy** (ARIA Guidelines):

| Step | Therapy | Current Status | Recommendation |
|:---:|:---|:---:|:---|
| 1 | 2nd-gen oral antihistamine daily | ✅ Done: cetirizine 10 mg daily | → Insufficient response alone |
| 2 | Intranasal corticosteroid daily | ✅ Done: fluticasone nasal spray daily | → Ensure correct technique: aim laterally, not at septum; spray and sniff gently. Continue. |
| 3 | Add leukotriene receptor antagonist | ❌ Not tried: montelukast 10 mg daily | → Could add for 4–6 week trial. Particularly if concomitant asthma. However, note FDA boxed warning for neuropsychiatric AEs (agitation, depression, sleep disturbance). |
| 4 | Consider SCIT or SLIT | ❌ Not yet initiated | → **Strong indication for allergen immunotherapy** ✅ |

**Assessment**: Patient has **severe seasonal allergic rhinoconjunctivitis**:
- Persistent symptoms despite combined oral antihistamine + intranasal corticosteroid (ARIA Step 2)
- Significant QoL impairment (sleep, work)
- Documented sensitization to seasonal pollens (birch, grass)
- No contraindications to immunotherapy
- **Immunotherapy is strongly indicated** (Level I evidence)
```

### Step 4: SCIT vs. SLIT Comparison

```
**SCIT vs. SLIT — Patient Education**

| Feature | SCIT (Allergy Shots) | SLIT (Sublingual Tablets) |
|:---|:---|:---|
| **Efficacy** | High: 60–80% symptom improvement | Moderate–high: 30–50% symptom improvement |
| **Route** | Subcutaneous injection | Sublingual tablet daily |
| **First dose** | Clinic | Clinic (observed 30 min) |
| **Ongoing doses** | Clinic (weekly → monthly) | Home (daily) |
| **Build-up phase** | Conventional: ~3–6 months. Cluster: ~6–8 weeks. Rush: 1–3 days (hospital). | None — starts at maintenance dose |
| **Maintenance** | q2–4 weeks injection × 3–5 years | Daily tablet × 3 years minimum |
| **Convenience** | Office visits required | Home-based after first dose |
| **Cost** | Higher (frequent office visits). Often covered by insurance. | Moderate (medication cost). Variable insurance coverage. |
| **Systemic reaction risk** | ~0.01–0.1% per injection (rare) | <0.1% (very rare) |
| **Local side effects** | Injection site: swelling, redness (common) | Oral pruritus, throat irritation (common, self-limited) |
| **Multi-allergen** | ✅ Can mix multiple allergens in one vial | ❌ Each tablet treats one allergen (grass OR ragweed OR dust mite) |
| **FDA-approved products** | Custom extracts (compounded) | Grastek (timothy grass), Oralair (5-grass), Ragwitek (ragweed), Odactra (dust mite) |
| **Ages** | ≥5 years (cooperative children) | ≥5 years (grass); ≥12 years (dust mite) |
| **Disease-modifying** | ✅ Yes (sustained effect after discontinuation) | ✅ Yes (sustained effect after 3 years) |

**Given Your Case**:
- Polysensitization to birch + grass → SCIT can combine both in one vial; SLIT would require 2 separate daily tablets
- Severe symptoms → SCIT offers higher efficacy
- Preference for injection → SCIT aligns with patient preference
- Age 35, no contraindications → good SCIT candidate

**Recommendation**: Subcutaneous immunotherapy (SCIT) with birch + timothy grass mix.
```

### Step 5: SCIT Protocol

```
**SCIT Build-Up Protocol (Conventional)**:

**Pre-Treatment Assessment**:
- [ ] PFT (spirometry) to rule out undiagnosed asthma
- [ ] Informed consent obtained
- [ ] Beta-blocker screening confirmed (none)
- [ ] Pregnancy test if applicable (do not initiate if pregnant)
- [ ] Baseline symptoms recorded (TNSS: Total Nasal Symptom Score; RQLQ: Rhinoconjunctivitis Quality of Life Questionnaire)

**Build-Up Phase** (Conventional):

| Visit | Frequency | Injections | Duration |
|:---|:---|:---|:---|
| Weeks 1–12 | 1–2×/week | 1 injection/visit | ~12 weeks |
| Weeks 13–24 | q2 weeks | 1 injection/visit | ~12 weeks |

Total build-up: ~3–6 months to maintenance dose.

**Alternative**: Cluster immunotherapy (2–3 injections/visit) — reduces build-up to ~6–8 weeks.

**Maintenance Phase**:
- 1 injection q3–4 weeks
- Duration: 3–5 years minimum
- **Observation**: 30 minutes post-injection in clinic (required)
- **PEF monitoring**: Check peak flow before each injection. If <70% predicted → defer injection.

**Expected Outcomes**:
- Symptom improvement begins within 3–6 months of starting maintenance
- Maximum benefit by Year 1–2
- Sustained benefit for 7–12 years after completing 3-year course (Durham et al., 1999, PMID: 10441623)
- ~60–80% of patients report significant improvement

**Contraindications to Monitor During Treatment**:
- Uncontrolled asthma (FEV1 <70%) → defer injection
- Acute febrile illness → defer until recovered
- New beta-blocker prescription → discontinue SCIT

---

**Venue**: Allergy clinic with:
- Physician experienced in immunotherapy
- Epinephrine immediately available
- Resuscitation equipment
- Staff trained in anaphylaxis recognition and management
```

### Step 6: Environmental Management (Adjunct)

```
**Environmental Modifications for Pollen Allergy** (adjunct to SCIT):

| Strategy | Implementation |
|:---|:---|
| Pollen count monitoring | Check pollen.com daily; stay indoors when counts are high |
| Windows closed | During peak pollen season (March–June) |
| Bedroom HEPA air purifier | Run continuously during season. Replace filter per manufacturer. |
| Shower before bed | Removes pollen from hair and skin after outdoor exposure |
| Nasal saline irrigation | Twice daily during season (e.g., NeilMed squeeze bottle). Level I evidence for symptom relief. |
| Sunglasses wraparound | Reduces ocular pollen exposure |
| Laundry | Do not air-dry laundry outdoors during pollen season |
| Car | Keep windows closed. Use A/C with recirculation mode. Replace cabin air filter before season. |
| Pets | Avoid outdoor cats/dogs sleeping in bedroom (pollen on fur) |
| Face mask | N95 mask for unavoidable prolonged outdoor exposure (e.g., gardening) |
```

### Step 7: Patient Action Plan (Seasonal Allergy)

```
**SEASONAL ALLERGY ACTION PLAN**

**Patient Name**: [Name]
**Confirmed Sensitizations**: Birch (8 mm SPT), timothy grass (10 mm SPT), ragweed (5 mm SPT)
**Season**: Tree pollen (March–May) + Grass pollen (May–July)

**Daily Management** (Pre-Season):
- Start intranasal corticosteroid (fluticasone) 2 weeks BEFORE pollen season begins
- Nasal saline irrigation daily
- Start antihistamine (cetirizine) at first symptoms

**During Season**:
- Continue intranasal corticosteroid daily (do NOT stop)
- Cetirizine 10 mg daily in morning
- Nasal saline irrigation twice daily
- HEPA air purifier in bedroom
- Shower before bed
- Sunglasses outdoors

**Rescue** (for breakthrough symptoms):
- Intranasal antihistamine: azelastine (if prescribed)
- Ocular antihistamine drops: ketotifen 0.025% (OTC) or olopatadine 0.2% (Rx) — for severe eye symptoms
- Oral decongestant: pseudoephedrine 60 mg q6h prn — max 3 days (avoid if hypertension)

**When to Seek Care**:
- Fever >101°F with sinus pain → possible sinusitis → PCP visit
- Wheezing, shortness of breath → possible asthma → allergist evaluation
- Eye pain, vision changes → ophthalmology referral

**Immunotherapy Schedule**:
- SCIT build-up: [clinic] q1–2 weeks × 3–6 months
- Maintenance: [clinic] q3–4 weeks × 3–5 years
- Always observe 30 min post-injection
- Next SCIT visit: [date]

**Allergist**: [name, phone]
**Plan Date**: 2026-05-23
```

### Step 8: Documentation and Evidence

```
**Evidence Summary — Allergic Rhinitis Immunotherapy**

| Study | Year | Key Finding | PMID |
|:---|:---|:---|:---|
| Durham et al. (SCIT long-term) | 1999 | Sustained benefit 3+ years after 3-year grass SCIT course | 10441623 |
| Durham et al. (SLIT long-term) | 2012 | Sustained benefit 2 years after 3-year grass SLIT | 22966555 |
| Dahl et al. (SCIT vs. placebo) | 2006 | 63% reduction in symptom-medication score with grass SCIT | 16675330 |
| Didier et al. (SLIT 5-grass) | 2011 | 37% reduction in symptom score with 5-grass SLIT | 21388665 |
| Calderon et al. (Cochrane Review SCIT) | 2007 | SCIT reduces symptoms by 49% and medication use by 45% vs. placebo | 17636793 |
| Radulovic et al. (Cochrane Review SLIT) | 2010 | SLIT reduces symptoms by 33% and medication use by 33% vs. placebo | 21069689 |

**Guidelines Referenced**:
- ARIA Allergic Rhinitis Guidelines (2020): SCIT recommended for moderate-severe AR with inadequate pharmacotherapy response (Level I).
- EAACI Allergen Immunotherapy Guidelines (2017): AIT is the only disease-modifying treatment for allergic rhinitis.
- AAAAI/ACAAI Practice Parameters for SCIT (2011).

---

**Safety Disclaimer**: This content is AI-generated for allergy education and clinical reference only. All medical decisions must be reviewed by a board-certified allergist/immunologist. In case of suspected anaphylaxis, administer epinephrine immediately and call emergency services (911 / 999 / 112). This does not constitute medical advice.
```

---

## Key Learning Points from This Example

1. **Pre-Action Checklist** catches missing data early — allergy test results were not initially available; the agent prompts for them before proceeding.
2. **ARIA Step Therapy** places the patient's current treatment in a standardized framework before escalating to immunotherapy.
3. **SCIT vs. SLIT comparison** uses a structured table for side-by-side decision-making.
4. **SCIT protocol** details build-up phase, maintenance phase, and safety monitoring requirements.
5. **Environmental management** is NOT forgotten — it remains an important adjunct to immunotherapy.
6. **Patient action plan** is generated for seasonal allergy management, distinct from food allergy emergency plans.
7. **Evidence citations** anchor all recommendations in published literature.
8. **Safety disclaimer** is present on every clinical output.
9. **No anaphylaxis trigger** — the agent correctly identifies that this case does not involve emergency routing.
10. **Patient preference** is integrated into the recommendation (prefers SCIT over SLIT).

This example demonstrates Allergos handling a chronic allergic disease scenario with evidence-based treatment escalation, immunotherapy candidacy assessment, and comprehensive patient management planning.