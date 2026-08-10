# .claude/ — project-level Claude Code configuration

**Last updated**: 2026-04-08

## settings.json

Project-scoped hooks that run only in this repo (and repos forked from it).

### PostToolUse hooks

All hooks **block** (exit 2) — fix the issue before proceeding.

| Hook             | File                           | Added      | What it blocks                                                                                    |
| ---------------- | ------------------------------ | ---------- | ------------------------------------------------------------------------------------------------- |
| HSL enforcement  | `hooks/hap_hsl_enforce.sh`     | 2026-04-08 | Hex (#xxx) and rgb() colors in .css/.astro files. Skips shiki-hap-theme.css.                      |
| Image validation | `hooks/hap_image_validate.sh`  | 2026-04-08 | Missing alt text, missing width/height, old Cloudinary URL format in pages/\*.astro.              |
| Voice check      | `hooks/hap_voice_check.sh`     | 2026-04-08 | Forbidden phrases ("You should", "Obviously", "It's simple", "Just", "simply") in pages/\*.astro. |
| Copyright check  | `hooks/hap_copyright_check.sh` | 2026-04-08 | Missing HAP copyright comment in pages/_.astro and layouts/_.astro.                               |

### Global hooks that also apply here

These live in `~/.claude/settings.json` and fire on HAP projects via `*/HAP/*` path matching:

| Hook             | File                                  | What it does                                                                                                     |
| ---------------- | ------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Dangerous JS     | `~/.claude/hooks/hap_dangerous_js.sh` | PreToolUse — blocks eval(), new Function(), innerHTML=, document.write(), setTimeout(string) in .js/.astro files |
| Safety validator | `~/.claude/hooks/safety_validator.sh` | PreToolUse — blocks destructive commands and writes to sensitive files                                           |
| oxfmt formatter  | (inline in settings)                  | PostToolUse — auto-formats .md/.js/.jsx after edits                                                              |

## hooks/

Shell scripts executed by the hooks defined in settings.json. Each script:

- Reads JSON from stdin via `jq`
- Exits 0 to allow, exits 2 to block (with message on stderr)
- Prefers `rg` over `grep` when available

## How to add a new hook

1. Write the script in `hooks/`
2. `chmod +x` it
3. Add the entry to `settings.json` with matcher, command path (relative to repo root), and timeout
4. Validate JSON: `jq . .claude/settings.json`
