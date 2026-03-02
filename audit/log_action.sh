#!/usr/bin/env bash
TS=$(date -Iseconds)  # ISO 8601 timestamp
USER=$(whoami)
MSG="$*"

# Appends the action to a persistent log file.
echo "$TS | $USER | $MSG" >> evidence/logs/claude-actions.log
