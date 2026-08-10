#!/bin/bash
# PostToolUse: Validate images in station files
# Project-scoped hook — BLOCKS on all violations
# Missing alt, missing dimensions, old URL format

INPUT=$(cat)
FILE=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')

# Only apply to station pages and Astro page files
[[ "$FILE" != *"/pages/"* ]] && exit 0
[[ "$FILE" != *.astro ]] && exit 0

# Prefer rg, fall back to grep
RG=$(command -v rg 2>/dev/null || echo "grep")

ERRORS=""

# Missing alt text — a11y violation
if $RG -Pn '<img[^>]*>' "$FILE" 2>/dev/null | $RG -v 'alt=' | head -3 > /tmp/img-no-alt.txt; then
  if [ -s /tmp/img-no-alt.txt ]; then
    ERRORS="$ERRORS\nMissing alt text:\n$(cat /tmp/img-no-alt.txt)"
  fi
fi

# Missing width/height — causes layout shift
if $RG -Pn '<img[^>]+>' "$FILE" 2>/dev/null | $RG -v 'width=' | head -3 > /tmp/img-no-dims.txt; then
  if [ -s /tmp/img-no-dims.txt ]; then
    ERRORS="$ERRORS\nMissing width/height:\n$(cat /tmp/img-no-dims.txt)"
  fi
fi

# Old Cloudinary URL format with version numbers
if $RG -Pn 'cloudinary.com.*/v\d{10}/' "$FILE" 2>/dev/null | head -3 > /tmp/img-old-url.txt; then
  if [ -s /tmp/img-old-url.txt ]; then
    ERRORS="$ERRORS\nOld Cloudinary URL format (use canvas/hap/ path):\n$(cat /tmp/img-old-url.txt)"
  fi
fi

if [ -n "$ERRORS" ]; then
  echo "BLOCKED — image issues in $FILE:" >&2
  echo -e "$ERRORS" >&2
  echo "Fix before proceeding. See skills/hap-image-validation/SKILL.md" >&2
  exit 2
fi

exit 0
