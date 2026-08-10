#!/bin/bash
# PostToolUse: Block HTML/Astro files missing copyright notice
# Project-scoped hook — BLOCKS on violations

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only apply to pages and layouts
[[ "$FILE" != *"/pages/"* && "$FILE" != *"/layouts/"* ]] && exit 0
[[ "$FILE" != *.astro ]] && exit 0

# Prefer rg, fall back to grep
RG=$(command -v rg 2>/dev/null || echo "grep")

# Check for copyright notice
if ! $RG -q 'HAP Educational Content' "$FILE" 2>/dev/null; then
  echo "BLOCKED — missing copyright notice in $FILE:" >&2
  echo "All HTML/Astro files must include the HAP copyright comment." >&2
  echo "Add: <!-- HAP Educational Content © 2026 Cynthia Teeters. All rights reserved. -->" >&2
  exit 2
fi

exit 0
