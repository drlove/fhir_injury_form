#!/usr/bin/env bash
INPUT=$(cat)
SESSION=$(echo "$INPUT" | jq -r '.session_id // ""')
TS=$(date -Iseconds)
FILENAME=$(date +"%Y%m%d_%H%M%S")

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(git -C "$(dirname "$0")" rev-parse --show-toplevel)}"
PROJECT_SLUG=$(echo "$PROJECT_DIR" | sed 's|[/_]|-|g')
TRANSCRIPT="$HOME/.claude/projects/$PROJECT_SLUG/${SESSION}.jsonl"
OUTDIR="$PROJECT_DIR/evidence/outputs"
mkdir -p "$OUTDIR"

[ -f "$TRANSCRIPT" ] || exit 0

# Extract the last assistant message that contains text (not just tool_use)
TEXT=$(jq -rs '
  [ .[] | select(
      .type == "assistant" and
      (.message.content | map(select(.type == "text")) | length > 0)
    )
  ] | last
  | [ .message.content[] | select(.type == "text") | .text ]
  | join("\n")
' "$TRANSCRIPT" 2>/dev/null)

[ -z "$TEXT" ] && exit 0

printf "Timestamp: %s\nSession:   %s\n\n%s\n" "$TS" "$SESSION" "$TEXT" \
  > "$OUTDIR/${FILENAME}.txt"
