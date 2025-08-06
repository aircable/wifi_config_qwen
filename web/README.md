# create-svelte

Everything you need to build a Svelte project, powered by [`create-svelte`](https://github.com/sveltejs/kit/tree/master/packages/create-svelte).

## Creating a project

If you're seeing this, you've probably already done this step. Congrats!

```bash
# create a new project in the current directory
npm create svelte@latest

# create a new project in my-app
npm create svelte@latest my-app
```

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://kit.svelte.dev/docs/adapters) for your target environment.


---
# Modern Embedded Web Development with SvelteKit, TailwindCSS, and an AI Coding Agent

_A student guide for embedded systems engineers moving into web UIs_

---

## Slide 1. Introduction: Why Modern Web Tech for Embedded?

- Embedded systems are increasingly delivered with a web-based UI for configuration/control.
- Expectations: fast loading, visually polished, mobile-ready, and secure, even on microcontrollers like ESP32/ESP-IDF.
- Traditional tools (Eleventy, static HTML, hand-crafted JS) are hard to maintain, optimize & update.
- **SvelteKit + Tailwind/DaisyUI**: Combines fast, reactive JS, component-based UI, and design system, but can output _pure static sites_ perfect for embedded.
- **AI agent assistance (Codex with AGENT.md)**: Boosts workflow, enforces best practices, and enables collaboration & optimization.

---

## Slide 2. Installation & Project Structure

### 1. Install Node.js (LTS, e.g. v18 or v20) & npm
### 2. Set up SvelteKit & TailwindCSS:
```sh
npx create-svelte@latest sksrc
# Follow prompts: Skeleton project, Typescript/no, Add Tailwind yes, ESLint yes, Prettier yes
cd sksrc
npm install
```
### 3. Directory Layout
- `sksrc/` - All modern web source (leave old /src for 11ty/legacy builds)
- `sksrc/static/` - Static files (img/, favicon, robots.txt)
- `sksrc/src/routes/` - SvelteKit page endpoints and logic
- `sksrc/build/` - Your fully compressed output, ready for device deployment

---

## Slide 3. About the Agent System (AGENT.md & Workflow)

### AGENT.md Model: Frontend-Designer
- Specialized for embedded design, SvelteKit, Tailwind/DaisyUI, modular layout, high performance, mobile friendly
- Proactive: recommends creative, branded UI, component reuse, modern patterns
- Collaboration rules: Always plan, document, and summarize before big changes; never destroy; always optimize for resource limits

### Workflow, Agent & You
1. Propose/design page (user describes function, AGENT offers a creative, modular plan)
2. AGENT plans & implements: new routes, components, theme, with embedded performance in mind
3. User reviews in browser/dev, iterating rapidly
4. AGENT scripts asset compression (gzip), image optimization, and ensures build output is device-ready

---

## Slide 4. Typical Design-to-Deployment Flow

1. **Draft UI page as Svelte file** (`+page.svelte`, e.g., for Serial/Terminal)
2. **Create/optimize components** (navigation, footer, header, minimal terminal, etc)
3. **Test local dev server**
4. **Agent-guided optimization**:
   - All .js/.css/.html/.json GZIPPED after SvelteKit static build (no uncompressed copies)
   - Images resized/compressed as needed (use imagemin/cli or external tool)
   - SVG icons inlined into Svelte (no HTTP requests)
5. **Ready-to-flash**: Only `/build` directory, everything already optimized; ESP32 server always prefers .gz

---

## Slide 5. Embedded-focused Optimization Rationale

### Why?
- Embedded systems have:
  - Low RAM and FLASH
  - Slow, low-bandwidth microcontroller file serving (not CDN!)
  - Limited file count/length on FS (e.g., LittleFS)
- All user-facing frontend code/assets **must be static, compressed, and minimized**

### Our Choices
- **GZIP everything:** smallest possible transfer to device (ESP32 file server looks for .gz)
- **Only ship .gz**: uncompressed never flashed, saves FLASH and bandwidth
- **Image resizing/compression in build:** every byte matters. No 100kb logo if 6kb works!
- **Inline SVG:** No font/extra dependencies, fast mobile UX (1 request instead of 10+)
- **Prerendered/Static SvelteKit:** No runtime code, no server-side JS required on micro (just pure files)

---

## Slide 6. Embedded Web File Server Requirements

### The server must...
- Prefer .gz assets if available (by Accept-Encoding or by default)
- Set correct Content-Type and Content-Encoding
- Correctly route for `/img/`, favicons, `/robots.txt`, etc.
- Handle WebSocket URIs, and serve binary mode for full ASCII/control range
- *Optional:* whitelist assets/folders for unauthenticated access (e.g., `/img/logo.webp` on `/login`)

---

## Slide 7. Real Example: Serial Terminal UI

- **Lightweight terminal emulator**: only CR, LF, BS, TAB and printable chars interpreted
- Every key sent immediately over WebSocket (no line buffering)
- Local "echo" checkbox for device & protocol debug; CRLF only affects display
- Full device-to-UI round-trip for true serial-over-web debugging

---

## Slide 8. The Build Process (from code to chip flash)

1. `npm run build` or `./buildsite.sh` in `sksrc/`
2. GZIP all JS/CSS/HTML/JSON in-place (removing non-.gz to save space)
3. Optimize images (with imagemin-cli or any other tool you script)
4. (Optional: verify with Python/http-server before flashing)
5. Flash ESP32 using only the `build/` directory

**No server-side Node needed after build: it's pure static files!**

---

## Slide 9. Summary & Best Practices

- SvelteKit + Tailwind + DaisyUI = efficient, maintainable, beautiful web apps...even for microcontrollers!
- The AGENT system enforces best design, optimization, and non-destructive workflow
- Pure-static GZIP + image/crucial asset optimization is essential for embedded
- Keep file count and byte size minimal; inline icons and favicons
- Test locally, deploy as static (no server logic needed on device!)
- Always iterate with an agent-or-human QA pass!

*With these tools and practices, even backend/firmware engineers can deliver modern, efficient, and visually polished web UIs for embedded devices.*
---
