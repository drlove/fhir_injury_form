// ============================================================
// InjuryIG Extension: Place of Injury
// ============================================================
// WHY THIS EXTENSION EXISTS:
//   The type of place where an injury occurred (e.g., home,
//   road, workplace, public area) is a required field on the
//   standard Injury Form but has no corresponding element in
//   base FHIR R4 Condition.
//
//   Encounter.location is NOT equivalent — it records where
//   the patient is being treated, not where the injury happened.
//
//   PH Core v0.1.0 defines no extension for place of injury.
//   (PH Core extensions cover geographic/administrative data:
//   barangay, city, province, region — not injury event context.)
//
// APPLIED TO: InjuryCondition (Condition profile)
// DATA TYPE:  CodeableConcept
// CARDINALITY: 0..1
//
// TERMINOLOGY BINDING:
//   To be added in a future iteration.
//   Candidate value sets:
//     - ICD-10 Place of Occurrence codes (Y92.x)
//     - WHO external cause place of occurrence codes
//
// INJURY FORM FIELD: "Place of Injury"
// ============================================================
Extension: PlaceOfInjury
Id: place-of-injury
Title: "Place of Injury"
Description: "The type of place or environment where the injury event occurred
(e.g., home, street or highway, workplace, school, public area, sports facility).
This is distinct from Encounter.location, which records where treatment is given.
FHIR R4 Condition has no standard element for this concept.
PH Core v0.1.0 has no equivalent extension.
Terminology binding (e.g., ICD-10 Y92 Place of Occurrence codes) will be added
in a future iteration."
* value[x] only CodeableConcept


// ============================================================
// InjuryIG Extension: Mechanism of Injury
// ============================================================
// WHY THIS EXTENSION EXISTS:
//   The mechanism or external cause of injury (e.g., fall,
//   motor vehicle crash, assault, burn, drowning) is a required
//   field on the standard Injury Form and is a core variable in
//   injury surveillance and trauma registry reporting.
//
//   While ICD-10-CM V/W/X/Y external cause codes can encode
//   mechanism as a secondary Condition resource, the Injury Form
//   captures mechanism as a discrete structured field that must
//   be independently queryable without parsing diagnosis codes.
//
//   FHIR R4 Condition has no standard element for external cause
//   mechanism separate from the diagnosis code.
//
//   PH Core v0.1.0 defines no equivalent extension.
//
// APPLIED TO: InjuryCondition (Condition profile)
// DATA TYPE:  CodeableConcept
// CARDINALITY: 0..1
//
// TERMINOLOGY BINDING:
//   To be added in a future iteration.
//   Candidate value sets:
//     - ICD-10 External Cause codes (V01–Y89)
//     - SNOMED CT mechanism of injury concepts
//     - Local DOH/PGH mechanism classifications
//
// INJURY FORM FIELD: "Mechanism of Injury"
// TERMINOLOGY SERVER: https://tx.fhirlab.net/fhir
// VALUE SET URI:      http://www.trauma.surgery.pgh.gov.ph/mechanismofinjury
// BINDING STRENGTH:   extensible
// ============================================================
Extension: MechanismOfInjury
Id: mechanism-of-injury
Title: "Mechanism of Injury"
Description: "The mechanism or external cause by which the injury was sustained
(e.g., fall, motor vehicle crash, assault, stab wound, burn, drowning).
Captured as a discrete structured field on the Injury Form for injury surveillance
and trauma registry purposes.
FHIR R4 Condition has no standard element for this concept.
PH Core v0.1.0 has no equivalent extension.
Bound to ValueSet: http://www.trauma.surgery.pgh.gov.ph/mechanismofinjury
Terminology server: https://tx.fhirlab.net/fhir"
* value[x] only CodeableConcept
* value[x] from MechanismOfInjuryVS (extensible)
