#!/usr/bin/env bash
INPUT=$(cat)
TS=$(date -Iseconds)
FILENAME=$(date +"%Y%m%d_%H%M%S")
SESSION=$(echo "$INPUT" | jq -r '.session_id // "unknown"')
PROMPT=$(echo "$INPUT" | jq -r '.prompt // ""')

OUTDIR="${CLAUDE_PROJECT_DIR:-$(git -C "$(dirname "$0")" rev-parse --show-toplevel)}/evidence/prompts"
mkdir -p "$OUTDIR"

printf "Timestamp: %s\nSession:   %s\nUser:      %s\n\n%s\n" \
  "$TS" "$SESSION" "$(whoami)" "$PROMPT" \
  > "$OUTDIR/${FILENAME}.txt"
