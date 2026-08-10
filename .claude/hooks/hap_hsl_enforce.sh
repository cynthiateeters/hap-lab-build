#!/bin/bash
# PostToolUse: Block hex/rgb colors in CSS and Astro files
# Project-scoped hook — lives in .claude/hooks/

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only apply to CSS and Astro files
[[ "$FILE" != *.css && "$FILE" != *.astro ]] && exit 0

# Skip shiki theme file — it uses css-variables theme which requires var() references
[[ "$FILE" == *"shiki-hap-theme"* ]] && exit 0

# Prefer rg, fall back to grep
RG=$(command -v rg 2>/dev/null || echo "grep")

# Check for hex colors (#xxx, #xxxxxx) and rgb/rgba
if $RG -Pn '(?<!-)(#[0-9a-fA-F]{3,8})\b|rgb\s*\(|rgba\s*\(' "$FILE" 2>/dev/null | $RG -v '^\s*//' | $RG -v '^\s*\*' | head -5 > /tmp/hsl-violations.txt; then
  if [ -s /tmp/hsl-violations.txt ]; then
    echo "HSL VIOLATION in $FILE:" >&2
    cat /tmp/hsl-violations.txt >&2
    echo "All colors must use hsl() format. See skills/css-standards/SKILL.md" >&2
    exit 2
  fi
fi

exit 0
