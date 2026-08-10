# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

**HAP's Learning Lab: How Sites Get Built.** An Astro static site explaining
what Node, npm, `package.json`, and a development server actually are. Built
for IDMX-268 Web Development II, first module.

Live at <https://hap-build.netlify.app>. Built 2026-08-10.

It is deliberately **assignment-agnostic**. It teaches the topic, never a
deliverable. Never name a starter repo, a client, a spec, a part number, or a
checklist item in the content.

## Commands

```bash
bun run dev      # dev server at localhost:4321
bun run build    # production build to dist/
bun run preview  # serve the built output
```

**Toolchain boundary:** this repo is built with `bun`. Teaching content inside
the pages uses `npm`, `npx`, and `node`, because that is what students run.
Students read the site and never clone it. See
`.claude/teaching-content-boundary.md`.

## This lab has pages, not stations

This is the first lab built without stations, and it is a prototype for a
content model the template does not have yet. **Read `docs/page-types.md`
before changing structure.**

- Reading order lives in `src/data/pages.js`. Adding or reordering a page is
  an edit to that one file.
- `src/layouts/PageLayout.astro` reads a page's neighbours and its type from
  there. There is no `StationLayout` and no station number arithmetic.
- Each page is written in one Diataxis mode: Explanation, Tutorial, or
  Reference. The mode shows as a badge in the header.
- **Reference pages have no HAP.** No avatar, no notes, no footer reminder.
  The layout enforces this from the page's type, so it cannot drift.

## Voice

HAP is a mascot, not a narrator. The confusion-to-confidence arc, required
confessions, and the word "station" were all retired by Cynthia on
2026-08-10. `docs/reference-cards/hap-voice-card.md` carries the current
rules, and `~/.claude/rules/voice.md` sits above it.

The constraint most likely to fail review: the prose has to read as a person
writing for college students, and must not read as generated.

## Hooks

Four blocking PostToolUse hooks in `.claude/hooks/`, wired in
`.claude/settings.json`. They fire on Edit and Write.

| Hook | Blocks |
| --- | --- |
| `hap_hsl_enforce.sh` | hex and `rgb()` colors in `.css` and `.astro` |
| `hap_copyright_check.sh` | pages and layouts missing the HAP copyright comment |
| `hap_voice_check.sh` | forbidden phrases in `src/pages/` |
| `hap_image_validate.sh` | images missing alt or dimensions, old Cloudinary URLs |

A fifth lives globally at `~/.claude/hooks/hap_dangerous_js.sh`. It blocks
dangerous JavaScript patterns, and it also blocks *prose* naming them inside
`.astro` and `.html`. Writing about those functions means writing the name
without its parentheses.

## CSS

All colors use `hsl()`. Custom properties are defined in the `:root` block of
`src/styles/global.css`. Say "CSS custom property", never "CSS variable".

Three additions this lab made to the inherited design system, all at the end
of `global.css`:

- `.page-type-badge` and its three variants. All three pass 4.5:1 on their
  own backgrounds, measured 2026-08-10.
- `min-width: 0` on code block wrappers and on card components. Grid and flex
  items are min-content wide by default, so one long token in a card heading
  used to push the whole page sideways on a phone. This is the fix, and it is
  worth backporting.
- `overflow-wrap` on inline code and card bodies. Block code is exempt,
  because it scrolls, and breaking a line there would lie about what to type.

## Images

**Never guess a HAP image filename.** Verify against the memory-keeper
`cloudinary-inventory` channel. Current URLs use the `canvas/hap/` path with
no version number; the `hap_image_validate.sh` hook blocks the older
`/v1234567890/` format.

Every image on this site was confirmed to return 200 on 2026-08-10.

## Accessibility

WCAG 2.2 AA. Verified 2026-08-10: no horizontal overflow at 320, 375, 768,
1024, or 1280 across all ten pages; heading order with no skipped levels; alt
text and explicit dimensions on every image; skip link on every page; badge
contrast at or above 4.5:1.

## Heading case

- `.astro` and `.html`: Title Case
- `.md`: sentence case

## Copyright

Every `.astro` file under `src/pages/` and `src/layouts/` carries the HAP
copyright comment. A hook blocks the file otherwise.
