#!/usr/bin/env bash

ID=$(uuidgen)
TS=$(date -Iseconds)
# Captures the current Git commit hash to link the code state to the AI action.
COMMIT=$(git rev-parse HEAD 2>/dev/null || echo "uncommitted")

# Generates a machine-readable JSON file for interoperable audit logs.
cat > provenance/fhir/provenance-$ID.json <<EOP
{
  "resourceType": "Provenance",
  "id": "$ID",
  "recorded": "$TS",
  "activity": {
    "coding": [{
      "system": "http://terminology.hl7.org/CodeSystem/provenance-activity-type",
      "code": "AIASSIST"
    }]
  },
  "agent": [{
    "type": { "text": "AI Assistant" },
    "who": { "display": "Claude Cowork" }
  }],
  "entity": [{
    "role": "source",
    "what": { "display": "Git commit $COMMIT" }
  }]
}
EOP

echo "FHIR Provenance created."
