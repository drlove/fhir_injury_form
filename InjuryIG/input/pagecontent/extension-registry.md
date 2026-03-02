# InjuryIG Extension Registry

This page documents **every extension defined in InjuryIG that does not already exist in PH Core**.

**Design rule:** InjuryIG profiles inherit PH Core profiles wherever possible. A new InjuryIG extension is only permitted when:
1. The clinical data element is required by the standard Injury Form, AND
2. No equivalent element exists in the base FHIR R4 resource, AND
3. No equivalent extension exists in PH Core v0.1.0.

---

## Extensions Available from PH Core (use these — do NOT re-define)

The following extensions are already defined in PH Core and must be referenced by their PH Core URLs:

| Extension | PH Core URL | Used On |
|-----------|------------|---------|
| Barangay | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/barangay` | Address |
| City/Municipality | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/city-municipality` | Address |
| Province | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/province` | Address |
| Region | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/region` | Address |
| Race | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/race` | Patient |
| Indigenous People | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/indigenous-people` | Patient |
| Indigenous Group | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/indigenous-group` | Patient |
| Educational Attainment | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/educational-attainment` | Patient |
| Occupation | `http://doh.gov.ph/fhir/ph-core/StructureDefinition/occupation` | Patient |

---

## InjuryIG-Specific Extensions

### PlaceOfInjury

| Field | Value |
|-------|-------|
| FSH file | `input/fsh/extensions/InjuryExtensions.fsh` |
| URL | `http://trauma.surgery.pgh.gov.ph/StructureDefinition/place-of-injury` |
| Applied to | InjuryCondition (Condition profile) |
| Data type | CodeableConcept |
| Cardinality | 0..1 |

**Clinical Justification:**
The type of place where an injury occurred (e.g., home, road, workplace, school, public area)
is a required field on the standard Injury Form and a core variable in injury surveillance.
It enables analysis of injury patterns by location type, informing prevention programs.

**Why not covered by base FHIR R4:**
`Encounter.location` records where the patient is being *treated*, not where the injury
*occurred*. `Condition` has no element for place of injury event. No other native FHIR R4
element represents this concept.

**Why not covered by PH Core:**
PH Core v0.1.0 extensions cover geographic/administrative identifiers (barangay, city,
province, region) applied to Address and Patient demographics. None represent the
*type of place* where an injury event occurred.

**Terminology Binding:** Pending. Candidate: ICD-10 Y92 (Place of Occurrence) codes.

---

### MechanismOfInjury

| Field | Value |
|-------|-------|
| FSH file | `input/fsh/extensions/InjuryExtensions.fsh` |
| URL | `http://trauma.surgery.pgh.gov.ph/StructureDefinition/mechanism-of-injury` |
| Applied to | InjuryCondition (Condition profile) |
| Data type | CodeableConcept |
| Cardinality | 0..1 |

**Clinical Justification:**
The mechanism of injury (e.g., fall, motor vehicle crash, assault, stab wound, burn,
drowning) is a required field on the standard Injury Form and is essential for trauma
registry reporting, resource allocation, and injury prevention policy.

**Why not covered by base FHIR R4:**
While ICD-10-CM V/W/X/Y external cause codes can encode mechanism as a secondary
Condition resource, the Injury Form captures mechanism as a discrete structured field
that must be independently queryable without parsing diagnosis codes. FHIR R4 Condition
has no standard element that separates mechanism from the injury diagnosis code.

**Why not covered by PH Core:**
PH Core v0.1.0 defines no extension for external cause or injury mechanism. Its
extensions are limited to patient demographics and geographic identifiers.

**Terminology Binding:** Pending. Candidates: ICD-10 V01–Y89 (External Cause) codes;
SNOMED CT mechanism of injury hierarchy; local DOH/PGH trauma classifications.

---

### Note on Date of Injury and Time of Injury

These are NOT extensions in InjuryIG. They are captured using the native FHIR R4
element `Condition.onsetDateTime` on the `InjuryCondition` profile.

`onsetDateTime` supports partial dates, which handles both cases on the Injury Form:
- **Date known, time unknown** → `"2026-03-01"` (date only)
- **Date and time both known** → `"2026-03-01T14:30:00+08:00"`

Using a native FHIR element here is consistent with the InjuryIG design rule of
minimizing extensions beyond PH Core.

<!--
TEMPLATE — copy and fill out for each new extension:

### [Extension Name]

| Field | Value |
|-------|-------|
| FSH file | `input/fsh/extensions/ExtensionName.fsh` |
| URL | `http://trauma.surgery.pgh.gov.ph/StructureDefinition/extension-name` |
| Applied to | [FHIR resource type, e.g. Encounter, Patient] |
| Data type | [e.g. CodeableConcept, string, boolean] |
| Cardinality | [e.g. 0..1] |

**Clinical Justification:**
[Explain what clinical concept this captures and why it appears on the standard Injury Form.]

**Why not covered by base FHIR R4:**
[Explain why no existing FHIR R4 element (including modifierExtension, reasonCode, etc.) can represent this.]

**Why not covered by PH Core:**
[Confirm the PH Core v0.1.0 extension catalog was checked and no equivalent exists.]

**Source / Reference:**
[Cite the Injury Form field, DOH regulation, ICD code, or clinical standard that requires this.]
-->
