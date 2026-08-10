#!/bin/bash
# PostToolUse: Block forbidden HAP voice phrases in station content
# Project-scoped hook — BLOCKS on violations

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only apply to station pages and Astro page files
[[ "$FILE" != *"/pages/"* ]] && exit 0
[[ "$FILE" != *.astro ]] && exit 0

# Prefer rg, fall back to grep
RG=$(command -v rg 2>/dev/null || echo "grep")

ERRORS=""

# Forbidden phrases — these break HAP's apprentice voice
# Check case-insensitive, word boundaries where possible
for phrase in "You should" "Obviously" "It's simple" "It is simple"; do
  if $RG -iPn "$phrase" "$FILE" 2>/dev/null | head -2 > /tmp/voice-hit.txt; then
    if [ -s /tmp/voice-hit.txt ]; then
      ERRORS="$ERRORS\nForbidden phrase \"$phrase\":\n$(cat /tmp/voice-hit.txt)"
    fi
  fi
done

# "Just" and "simply" as standalone minimizers (case-insensitive)
# Match "Just do", "just click", "simply add" etc — not "justice", "adjustment"
if $RG -iPn '\bjust\s+[a-z]' "$FILE" 2>/dev/null | $RG -iv 'justice|adjust|justified' | head -2 > /tmp/voice-just.txt; then
  if [ -s /tmp/voice-just.txt ]; then
    ERRORS="$ERRORS\nMinimizer \"just\" detected:\n$(cat /tmp/voice-just.txt)"
  fi
fi

if $RG -iPn '\bsimply\s' "$FILE" 2>/dev/null | head -2 > /tmp/voice-simply.txt; then
  if [ -s /tmp/voice-simply.txt ]; then
    ERRORS="$ERRORS\nMinimizer \"simply\" detected:\n$(cat /tmp/voice-simply.txt)"
  fi
fi

if [ -n "$ERRORS" ]; then
  echo "BLOCKED — HAP voice violation in $FILE:" >&2
  echo -e "$ERRORS" >&2
  echo "HAP uses first-person apprentice voice. See docs/reference-cards/hap-voice-card.md" >&2
  exit 2
fi

exit 0
