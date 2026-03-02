// ============================================================
// InjuryCondition Profile
// ============================================================
// Parent: Condition (base FHIR R4)
//
// Note: PH Core v0.1.0 does not define a Condition profile.
// This profile therefore inherits directly from base FHIR R4
// Condition and is the first Condition profile in InjuryIG.
//
// DATE AND TIME OF INJURY — no extensions required:
//   Condition.onsetDateTime is the canonical FHIR R4 element
//   for recording when a condition began. For injuries, this
//   IS the date (and optionally time) of the injury event.
//
//   onsetDateTime supports partial dates, so:
//     - Date known, time unknown  →  "2026-03-01"
//     - Date and time both known  →  "2026-03-01T14:30:00+08:00"
//
//   Using this native element instead of separate DateOfInjury
//   and TimeOfInjury extensions is consistent with the InjuryIG
//   design rule of minimizing extensions beyond PH Core.
//
// PLACE AND MECHANISM OF INJURY — extensions required:
//   FHIR R4 Condition has no standard element for either.
//   See InjuryExtensions.fsh for full justification of each.
// ============================================================
Profile: InjuryCondition
Parent: Condition
Id: injury-condition
Title: "Injury Condition"
Description: "A profile on FHIR R4 Condition representing an injury diagnosis.
Captures the date and time of injury (via the native Condition.onsetDateTime
element), place of injury, and mechanism of injury.

Date of Injury and Time of Injury are encoded in Condition.onsetDateTime
(required). The time component is optional — record it when known.
This avoids the need for separate DateOfInjury and TimeOfInjury extensions.

Place of Injury and Mechanism of Injury are captured as InjuryIG-specific
extensions (see extension-registry page). Terminology bindings for these
fields will be defined in a future iteration.

PH Core v0.1.0 does not define a Condition profile; this profile inherits
directly from base FHIR R4 Condition."

// ── InjuryIG extensions ────────────────────────────────────
* extension contains
    PlaceOfInjury named placeOfInjury 0..1 MS and
    MechanismOfInjury named mechanismOfInjury 0..1 MS

// ── Injury diagnosis code (e.g., ICD-10 S/T codes) ─────────
* code 1..1 MS
* code ^short = "Injury diagnosis code (e.g., ICD-10-CM S or T codes)"

// ── Date (and optionally time) of injury ───────────────────
// Uses native FHIR R4 onsetDateTime — no extension needed.
// Required: date of injury must always be recorded.
// Time is optional within the dateTime type.
* onset[x] only dateTime
* onsetDateTime 1..1 MS
* onsetDateTime ^short = "Date of Injury (required). Include time if known: e.g., 2026-03-01T14:30:00+08:00"

// ── Patient must be a PH Core Patient ──────────────────────
* subject 1..1 MS
* subject only Reference(PHCorePatient)
