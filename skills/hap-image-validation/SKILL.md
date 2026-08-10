# HAP image validation

## Description

Validate that HAP character images are emotionally appropriate for their content context and use correct Cloudinary URLs. This skill ensures consistent visual storytelling that reinforces HAP's apprentice learning journey across all educational content.

## When to use this skill

**ALWAYS** use this skill when:

- Creating new station HTML files
- Editing HAP note callouts or image placements
- Reviewing content before committing
- After changing content that might affect emotional context
- Before deployment to verify all image links work

## Image lookup

**Never hardcode image filenames.** Always verify against memory-keeper:

```
mcp__memory-keeper__context_search with query "canvas/hap", channel "cloudinary-inventory"
```

Or for a specific image: `/hap-inventory {name}`

To sync MK with Cloudinary after bulk changes: `/hap-inventory sync`

## Progressive validation steps

### Step 1: Emotional context validation

For EACH HAP image in the file, verify the emotional context matches an appropriate image from the inventory.

#### Emotional state mapping

**Neutral studying/learning**:

- Use: `hap-laptop`, `hap-canvas-js`
- **Context**: Hero sections, general learning moments, steady practice

**Confusion/struggle/mistakes**:

- Use: `hap-confused-map`, `hap-sconcerned-laptop`, `hap-sad-falling-papers`
- **Context**: HAP's mistakes, "what went wrong", confusion callouts, problem descriptions

**Breakthrough/aha moments**:

- Use: `hap-brain-explodes`, `hap-celebrating`, `hap-thumbs-up`, `hap-arms-up`
- **Context**: Major realizations, paradigm shifts, victories
- Reserve `hap-brain-explodes` for genuine breakthroughs (1 per station max)

**Major celebrations/success**:

- Use: `hap-celebrating`, `hap-holding-trophy`
- **Context**: Challenge completion, major milestones, significant achievements

**Teaching/explaining**:

- Use: `hap-lectures`, `hap-scientist`, `hap-pointing-up`, `hap-coach`
- **Context**: When HAP transitions from learner to teacher, scientific approach

**Debugging/investigation**:

- Use: `hap-w-bug`, `hap-fishing-for-code`
- **Context**: Debugging sections, troubleshooting, problem investigation

**Welcoming/farewell**:

- Use: `hap-waving`, `hap-tools-wave`, `hap-sunrise`
- **Context**: Welcome messages, conclusion sections, "see you next time"

**Practice/reflection/encouragement**:

- Use: `hap-holding-rubber-duck`, `hap-thinking-w-duck`, `hap-clipboard-checklist`
- **Context**: Understanding checks, practice scenarios, encouragement, closing reflections

**Security/safety**:

- Use: `hap-hard-hat-wrench`, `hap-legacy-shield`, `hap-data-safe`
- **Context**: Security topics, validation, protecting data

**Grace Hopper (precision/authority)**:

- Use: `grace-reviewing-code`, `grace-stop-hand`, `grace-safety-first`, `grace-scientist-flask`, `grace-at-workstation`, `grace-pointing-up-terminal`
- **Context**: Only when precision, authority, or code review matters. Grace does not appear casually.

#### Common mismatches to fix

- Using `hap-brain-explodes` for practice scenarios (use a duck or checklist image)
- Using `hap-celebrating` for every positive moment (reserve for BIG victories)
- More than 2 breakthrough images per station dilutes impact
- Zero confusion/struggle images means HAP's learning journey feels inauthentic

### Step 2: URL validation

For EACH HAP image, verify the Cloudinary URL follows the correct pattern:

#### Standard URL format

```
https://res.cloudinary.com/cynthia-teeters/image/upload/f_auto,q_auto,w_{WIDTH},c_limit/canvas/hap/{public-id}
```

No version numbers needed — the `canvas/hap/` path is stable.

#### Width guidelines

- `w_80` — footer images
- `w_150` — callout/note images
- `w_200` — hero images
- `w_400` — large feature images
- `w_480` — standalone display

#### Required URL components

- `f_auto` — automatic format selection (WebP when supported)
- `q_auto` — automatic quality optimization
- `w_{SIZE}` — width constraint
- `c_limit` — prevent upscaling

#### URL validation checklist

For each image URL:

- [ ] Starts with `https://res.cloudinary.com/cynthia-teeters/image/upload/`
- [ ] Contains `f_auto,q_auto`
- [ ] Has appropriate width for context
- [ ] Contains `c_limit`
- [ ] Uses `canvas/hap/{public-id}` path (no version numbers)
- [ ] Public ID exists in memory-keeper `cloudinary-inventory` channel

### Step 3: Alt text validation

For EACH HAP image, verify alt text is descriptive and matches the image.

#### Alt text requirements

- Maximum 125 characters (Canvas LMS limit)
- Descriptive and action-oriented
- Consistent with alt text stored in memory-keeper
- Check MK entry for the canonical alt text

**Never**:

- Generic ("HAP image", "image of HAP")
- Just emotional state without context ("HAP excited")
- Empty alt text (images are meaningful, not decorative)

### Step 4: HTML attribute validation

For EACH HAP image, verify required HTML attributes:

```html
<img
  src="[CLOUDINARY_URL]"
  alt="[DESCRIPTIVE_TEXT]"
  width="[SIZE]"
  height="[SIZE]"
  class="hap-note-image"
  OR
  class="footer-hybit"
  decoding="async"
  loading="lazy"
  OR
  fetchpriority="high"
/>
```

**Must have**:

- [ ] `src` — valid Cloudinary URL
- [ ] `alt` — descriptive text
- [ ] `width` — explicit dimension
- [ ] `height` — explicit dimension
- [ ] `class` — either `hap-note-image` or `footer-hybit`
- [ ] `decoding="async"` — for performance
- [ ] `loading` — either `"lazy"` (below-fold) OR `fetchpriority="high"` (hero/LCP)

**Never**:

- Missing width/height (causes layout shift — CLS penalty)
- Using `loading="lazy"` on hero image (use `fetchpriority="high"`)
- Using `fetchpriority="high"` on below-fold images (use `loading="lazy"`)

### Step 5: Emotional journey analysis

Analyze the COMPLETE station for balanced emotional progression:

#### Recommended distribution per station

- **1x Hero image** (learning/welcoming pose)
- **1-2x Confusion/struggle** (authentic learning journey)
- **1-2x Breakthrough** (earned moments only)
- **3-5x Practice/reflection** (steady learning)
- **1x Footer** (small, friendly)

#### Warning signs

- **Too many breakthroughs**: more than 2 breakthrough images dilutes impact
- **Too few struggles**: zero confusion images — doesn't show authentic learning
- **Unbalanced**: all positive or all struggle without progression
- **Well-balanced**: shows struggle -> learning -> breakthrough progression

## Validation output format

```markdown
## HAP image validation report — [station name]

### Summary

- Total HAP images: [N]
- Emotional context matches: [N/N]
- URL validation: [N/N]
- Alt text quality: [N/N]
- HTML attributes: [N/N]

### Issues found

[List any problems grouped by category]

### Recommendations

[Specific fixes needed]

### Overall assessment

PASS / NEEDS FIXES / FAIL
```

## Success criteria

**PASS** when:

- All image public IDs verified against MK `cloudinary-inventory` channel
- All images match emotional context of their content
- All Cloudinary URLs are valid and optimized
- All alt text is descriptive and accurate
- All required HTML attributes present
- Emotional journey shows balanced progression
- No more than 1 `hap-brain-explodes` per station
- No more than 1 `hap-celebrating` per station
- At least 1 confusion/struggle image per station

**FAIL** when:

- Any image public ID not found in MK inventory
- Missing required HTML attributes on any image
