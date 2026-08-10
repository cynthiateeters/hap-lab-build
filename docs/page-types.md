# Page types in this lab

This lab is the first one built without stations. It is a prototype for a
content model that the lab template does not have yet, so this file records
what the model is and why, for whoever decides whether to adopt it.

## The problem stations had

A station is one shape: HAP learns a skill by doing it, hand-held, light on
theory. That shape is a tutorial, and it is the only one the old template
knew how to render.

Most of what this lab teaches is not a tutorial. "What Node is" is
understanding-oriented. A command set is information-oriented. Forcing those
into a station meant wrapping reference material in a story, which is padding,
and it is one reason labs read long.

## The four types

Named for the four Diataxis modes. The type is a writing decision, not a
label students are expected to learn, though the badge does show it.

- **Explanation.** Why a thing exists, what problem it solved, how it fits.
  Read while studying rather than while working. Most of this lab.
- **Tutorial.** A guided exercise with a known outcome, safe to fail, run
  start to finish. One page here.
- **Reference.** Look-up material. Objective, no narrative, scannable, and
  written to be entered from the middle. Two pages here.
- **How-to.** Goal-oriented recipes. None here, because at this level the
  goals belong to an assignment rather than to the topic.

## What the type changes

| The type | Sets | Because |
| --- | --- | --- |
| Any | The badge in the header | A reader should know what kind of page they landed on |
| Reference | No HAP avatar, no HAP notes, no footer reminder | A character narrating a lookup table is a story in the way |
| Reference | Entered from the middle | Nobody reads a command list top to bottom |
| Tutorial | Numbered steps, one command per step | The reader has a terminal open |
| Explanation | Prose and cards, no steps | The reader is not doing anything yet |

Reference having no HAP is a decision of Cynthia's, made 2026-08-10. It is the
open question the workspace's `diataxis-and-labs.html` note ends on, answered.

## Voice, as of 2026-08-10

HAP is a mascot here, not a narrator. Cynthia retired the
confusion-to-confidence arc: it "was cute at first but then it got fixed and
got in the way." Getting content to the reader wins.

- No required confessions, no manufactured breakthrough, no arc per page.
- HAP appears in the header, in a small number of notes, and in the footer
  line. He does not carry the explanation.
- Grace Hopper appears where precision matters, which in this lab is the
  supply-chain warnings.
- The forbidden phrases still hold and are still hook-enforced: "You should",
  "Obviously", "It's simple", "just", "simply".
- The register is a college student who is capable and new to this. Direct
  sentences, contractions, no throat-clearing, and nothing that reads as
  generated.

## Adding or reordering a page

Reading order lives in `src/data/pages.js`. Add an entry with a slug, a type,
and a label, then create the page and pass its slug to `PageLayout`. Prev,
next, and the "page N of M" label all follow. Nothing else needs editing.

## What the template would need

If this model is adopted, the template needs four page templates rather than
one station template plus a cheat-sheet, `pages.js` in place of the station
number arithmetic, the badge styles, and a voice card per type. The
station-content and hap-voice skills describe the retired model and would
need rewriting rather than editing.
