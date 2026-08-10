// @ts-check
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://hap-build.netlify.app',
  build: {
    assets: 'assets'
  },
  markdown: {
    shikiConfig: {
      /* css-variables theme lets shiki-hap-theme.css control the colors */
      theme: 'css-variables',
      langs: ['html', 'css', 'javascript', 'json', 'markdown', 'bash', 'text'],
      wrap: true
    }
  }
});
