# Injury Form Implementation Guide

## Background

The **Injury Form** is the standard clinical documentation tool used by the
Division of Trauma, Department of Surgery, Philippine General Hospital (PGH)
to record the details of every injury case presenting to the department.
It captures patient demographics, injury event details (date, time, place, and
mechanism of injury), clinical findings, procedures, and disposition.

This Implementation Guide (IG) defines a set of FHIR R4 profiles, extensions,
and value sets that represent the Injury Form in a structured, interoperable
format. It enables the Injury Form data to be exchanged with the PGH
electronic medical record, submitted to the national trauma registry, and
used for injury surveillance and research.

---

## Scope

This IG covers the following sections of the Injury Form:

| Form Section | FHIR Resource | Profile |
|---|---|---|
| Patient demographics | Patient | [PH Core Patient](http://doh.gov.ph/fhir/ph-core/StructureDefinition/ph-core-patient) (reuse) |
| Injury diagnosis | Condition | [InjuryCondition](StructureDefinition-injury-condition.html) |

Additional sections (encounter, procedures, imaging, disposition) will be
profiled in future iterations.

---

## Design Principles

1. **Build on PH Core.** Profiles inherit from the [PH Core Implementation Guide](http://doh.gov.ph/fhir/ph-core)
   (v0.1.0) wherever possible. InjuryIG does not redefine what PH Core already defines.

2. **Minimize extensions.** A new InjuryIG extension is only defined when:
   - The clinical data element is required by the Injury Form, **and**
   - No equivalent element exists in base FHIR R4, **and**
   - No equivalent extension exists in PH Core v0.1.0.

   See the [Extension Registry](extension-registry.html) for the complete list
   and clinical justification for each extension.

3. **Use standard terminology.** Value sets reference ICD-10, SNOMED CT, and
   local PGH/DOH classifications where applicable. The InjuryIG terminology
   server is hosted at `https://tx.fhirlab.net/fhir`.

---

## Dependencies

| Package | Version | Purpose |
|---|---|---|
| `fhir.ph.core` | 0.1.0 | Philippine Core profiles and extensions |
| `hl7.fhir.r4.core` | 4.0.1 | Base FHIR R4 resources |

---

## Authors

**Division of Trauma, Department of Surgery**
Philippine General Hospital
Taft Avenue, Ermita, Manila, Philippines

Website: [http://www.pgh.gov.ph/surgery/trauma](http://www.pgh.gov.ph/surgery/trauma)

---

## Status

This IG is currently in **draft** status (ci-build, v0.1.0).
Content is under active development and is not yet approved for production use.
