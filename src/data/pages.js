/**
 * The reading order for this lab.
 *
 * Pages are named, not numbered. A page's neighbours and its "page N of M"
 * label come from this list, so reordering or adding a page is a one-line
 * change here rather than an edit to every page's navigation.
 *
 * `type` is the Diataxis mode the page is written in. It sets the badge in
 * the header and, for Reference, tells the layout to leave HAP out.
 */

export const pages = [
  {
    slug: "/what-built-means/",
    type: "Explanation",
    label: "What people mean when they say a site is built",
  },
  {
    slug: "/what-node-is/",
    type: "Explanation",
    label: "What Node is",
  },
  {
    slug: "/npm-is-not-node/",
    type: "Explanation",
    label: "npm is not Node",
  },
  {
    slug: "/make-a-package-json/",
    type: "Tutorial",
    label: "Make a package.json and read it out loud",
  },
  {
    slug: "/reference/package-json/",
    type: "Reference",
    label: "package.json fields",
  },
  {
    slug: "/why-a-dev-server/",
    type: "Explanation",
    label: "Why a dev server",
  },
  {
    slug: "/reference/commands/",
    type: "Reference",
    label: "Command set",
  },
  {
    slug: "/what-comes-next/",
    type: "Explanation",
    label: "Where this goes next",
  },
  {
    slug: "/working-with-ai/",
    type: "Explanation",
    label: "Working with an AI assistant on this",
  },
];

/**
 * Look up a page's neighbours and its position in the reading order.
 *
 * @param {string} slug - the page's own slug, exactly as listed above
 * @returns {{prevPage: object|undefined, nextPage: object|undefined, positionLabel: string, type: string}}
 */
export function navigationFor(slug) {
  const index = pages.findIndex((page) => page.slug === slug);

  if (index === -1) {
    throw new Error(`Unknown page slug: ${slug}. Add it to src/data/pages.js.`);
  }

  const previous = pages[index - 1];
  const next = pages[index + 1];

  return {
    prevPage: previous ? { url: previous.slug, label: previous.label } : undefined,
    nextPage: next ? { url: next.slug, label: next.label } : undefined,
    positionLabel: `Page ${index + 1} of ${pages.length}`,
    type: pages[index].type,
  };
}
