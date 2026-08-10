# skills/ — Claude Code skill definitions for this lab

**Last updated**: 2026-08-10

## What are skills?

Each subdirectory holds a `SKILL.md` giving Claude structured instructions for
one domain. They are reference documents loaded into context when relevant,
not executable code.

## Skill inventory

| Skill                | Path                            | Last updated | Purpose                                                 |
| -------------------- | ------------------------------- | ------------ | ------------------------------------------------------- |
| accessibility-check  | `accessibility-check/SKILL.md`  | 2026-04-08   | WCAG 2.2 AA validation                                  |
| css-standards        | `css-standards/SKILL.md`        | 2026-04-08   | hsl() color enforcement, custom property conventions    |
| demo-builder         | `demo-builder/SKILL.md`         | 2026-04-08   | HTML/CSS/JS patterns for interactive demos              |
| hap-image-validation | `hap-image-validation/SKILL.md` | 2026-04-08   | Emotional context mapping, URL and alt validation       |
| security-audit       | `security-audit/SKILL.md`       | 2026-04-08   | OWASP JavaScript security patterns                      |
| testing-framework    | `testing-framework/SKILL.md`    | 2026-04-08   | Testing tool selection and patterns                     |

## Change log

### 2026-08-10, when this lab was created

This lab retired stations for four Diataxis page types, so three inherited
skills stopped describing reality and were removed rather than left to
mislead:

- **station-content** removed. It required a station structure this lab does
  not have, including a Quick Reference block at the end of every station.
  Replaced by `docs/page-types.md`.
- **hap-voice** removed. It enforced the confusion-to-confidence arc and
  required confessions, both retired by Cynthia on 2026-08-10. Replaced by
  `docs/reference-cards/hap-voice-card.md`.
- **hap-video** removed. No video in this lab.

`hap-template-lab-astro` still carries all three in their old form. That is
expected: the template has not adopted this model yet, and this lab is the
prototype meant to inform that decision.

## How skills relate to hooks

All hooks block with exit code 2. Violations have to be fixed before work
continues.

| Skill / rule               | Hook                           | Blocks on                                                       |
| -------------------------- | ------------------------------ | --------------------------------------------------------------- |
| css-standards              | `hap_hsl_enforce.sh`           | hex and rgb() colors in .css and .astro                         |
| hap-image-validation       | `hap_image_validate.sh`        | missing alt, missing dimensions, old Cloudinary URL format      |
| voice card                 | `hap_voice_check.sh`           | "You should", "Obviously", "It's simple", "just", "simply"      |
| CLAUDE.md copyright rule   | `hap_copyright_check.sh`       | pages and layouts missing the HAP copyright comment             |
| security-audit             | `hap_dangerous_js.sh` (global) | dangerous JavaScript patterns, including in prose               |

The voice hook outlived the skill it came from. Those five phrases survived
the voice change and are still enforced.

Skills without hooks rely on being read at the right moment. `CLAUDE.md`
points to the relevant one per task.
