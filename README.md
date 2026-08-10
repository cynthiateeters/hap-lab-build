# HAP's Learning Lab: How Sites Get Built

What Node, npm, `package.json`, and a development server actually are.

Live at <https://hap-build.netlify.app>

## What it covers

Plenty of instructions tell a student to run `npm init` and then
`npm install`. This lab is about what those commands did, what they left on
disk, and why anyone designed it that way.

Nine pages: what "built" means, what Node is, why npm is a separate thing,
a hands-on walk through making a `package.json`, a reference for its fields,
why opening an HTML file directly stops working, a command set, where static
site generators fit, and how to work with an AI assistant on any of it.

It is assignment-agnostic. The commands are the real ones a student will
meet, and no particular project is named.

## Pages, not stations

This lab uses four page types drawn from Diataxis rather than six numbered
stations. Reading order lives in `src/data/pages.js`, and Reference pages
carry no HAP. See `docs/page-types.md` for the reasoning.

## Beginner's guide

You need [Node.js](https://nodejs.org) and [bun](https://bun.sh).

```bash
git clone https://github.com/cynthiateeters/hap-lab-build.git
cd hap-lab-build
bun install
bun run dev
```

That starts a development server at <http://localhost:4321>. Edit anything
under `src/` and the page reloads.

```bash
bun run build     # writes the finished site to dist/
bun run preview   # serves dist/ so you can check it before deploying
```

### Where things are

| Path | What is in it |
| --- | --- |
| `src/pages/` | One file per page |
| `src/data/pages.js` | Reading order, page types, navigation |
| `src/layouts/` | `MainLayout` (document shell) and `PageLayout` (per page) |
| `src/components/` | Header, Navigation, Footer, CodeBlock |
| `src/styles/global.css` | The design system, colors in `hsl()` only |
| `docs/` | The page-type model and the voice card |
| `.claude/hooks/` | Four blocking checks that run on every edit |

## Contributing

Issues and pull requests are welcome.

- Colors use `hsl()`. Hex and `rgb()` are blocked by a hook.
- Every page and layout needs the HAP copyright comment.
- Images need alt text and explicit `width` and `height`.
- Check a change in the browser before opening a pull request: no console
  errors, no horizontal scroll at 320px, and every link resolving.
- Content follows `docs/reference-cards/hap-voice-card.md`.

The HAP character and the educational content are proprietary. See
`TRADEMARK.md`. Please open an issue before proposing content changes.

## License

Code is MIT, © Cynthia Teeters. See `LICENSE`.

Educational content and the HyBit A. ProtoBot character are © 2026 Cynthia
Teeters, all rights reserved.
