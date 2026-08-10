# Teaching content vs. framework boundary

This document defines what students see versus what the build toolchain uses. The rule is simple: **the framework never leaks into teaching content.**

## What students see (teaching content)

Student-facing content includes: station body text, code examples in `<CodeBlock>`, cheat sheets, demos, and any HTML/CSS/JS shown as educational material.

- **Languages:** HTML, CSS, JavaScript
- **Package manager:** npm / npx / node (these are the tools students learn)
- **File references:** `.html`, `.css`, `.js` — never `.astro`
- **Syntax:** Standard HTML and JS — no JSX expressions, no Astro frontmatter fences, no `set:html` directives
- **Imports:** None — student code is standalone, not module-based (unless teaching modules explicitly)

## What the framework uses (build toolchain)

The Astro template, its layouts, components, and build pipeline are invisible to students.

- **Runtime:** bun (not npm)
- **Framework:** Astro with `.astro` single-file components
- **Syntax:** Astro frontmatter (`---`), JSX expressions (`{variable}`), `set:html`, component imports
- **Layouts:** StationLayout, MainLayout — students never see these names
- **Components:** CodeBlock, Header, Navigation, Footer — students interact with the output, not the source

## Where leakage happens

1. **Code examples in stations:** A `<CodeBlock>` showing how to add an event listener must use plain HTML/JS, not Astro component syntax
2. **Demos:** Interactive demo files are standalone HTML. They must not import Astro components or use `.astro` file patterns
3. **Cheat sheets:** Quick-reference code snippets must be copy-pasteable into a plain `.html` file
4. **npm vs bun:** If a station teaches `npm install`, that stays as `npm install` — do not convert to `bun add`
5. **Alt text and narrative:** HAP describes web concepts in standard terms ("HTML file", "stylesheet") — never "Astro component" or "frontmatter"

## Exceptions

- A lab that explicitly teaches Astro may show Astro syntax in teaching content
- Build instructions in `README.md` or `CLAUDE.md` correctly use `bun` — these are for lab builders, not students
