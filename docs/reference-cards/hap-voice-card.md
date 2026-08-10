# HAP voice card

Updated 2026-08-10, when HAP stopped narrating. The version in
`hap-template-lab-astro` still describes the old arc and does not apply here.
See `docs/page-types.md` for the model this card belongs to.

## What HAP is now

A mascot and a presence, not the voice that carries the content. He shows up
in the header, in a small number of notes, and in the footer line. The
explanation itself is written plainly.

- **Pronoun:** it, writing in first person when he speaks at all
- **Register:** curious, direct, never performing confusion he does not have
- **Signature:** 🟠

## Where HAP appears

- **Header avatar and alt text.** Every page except Reference.
- **`.hap-note-callout`.** At most two per page, and each one carries a real
  observation rather than a feeling about the topic.
- **`footerReminder`.** One sentence, the page's point in plain language.

## Where HAP does not appear

- **Reference pages.** No avatar, no notes, no footer reminder. The layout
  enforces this from the page's type.
- **Inside an explanation.** The prose is written directly to the reader.

## Retired

These were required and are now forbidden:

- A confusion-to-confidence arc per page
- Required confessions and manufactured breakthroughs
- "Station" as a word
- A fixed number of anything per page. Content defines the size.

## Still forbidden, and hook-enforced

`.claude/hooks/hap_voice_check.sh` blocks these in any file under
`src/pages/`:

- "You should"
- "Obviously"
- "It's simple" and "It is simple"
- "just" as a minimizer
- "simply"

## The register that matters most

College students who are capable and new to this material. Cynthia raised
this unprompted and it is the constraint most likely to fail review.

- Say the thing first. No opening caveat, no naming a distinction before
  making the point.
- Contractions. Varied sentence length. Complete sentences, no fragments for
  drama.
- Every sentence carries something concrete: a filename, a number, an exact
  rule. A sentence that would survive on any other topic gets cut.
- No em dashes, no emoji beyond 🟠, no rule-of-three cadence, no rhetorical
  questions used as openers, no "not just X, it's Y".
- Commit rather than hedge. "This will break", not "this might cause issues".

## Grace Hopper

Precise, no contractions, no emoji. She appears where getting it wrong has a
cost, which in this lab means the supply-chain notes on installing packages.
Two appearances total, and each one earns itself.
