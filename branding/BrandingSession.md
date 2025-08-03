# Branding Session Guide

This guide walks you through running a full branding redesign for your project.

## Step 1: Prepare
- Collect old logos (PNG, PSD, AI)
- Take screenshots of current site pages

## Step 2: Run Branding Agent
```bash
codex --profile branding/AGENT.md --model gpt-4o --chat
```
Paste this prompt:
> "Modernize our logo for web/embedded use. Output clean SVG, favicon set, PWA icons, and a brand guide (palette + typography)."

## Step 3: Review & Choose
- Ask for 2–3 concepts
- Select your preferred style
- Refine if needed

## Step 4: Finalize & Generate Assets
Run:
```bash
./branding/generate_brand_assets.sh
```
This will:
- Optimize the logo
- Generate favicons and PWA icons
- Update Tailwind + DaisyUI configs

## Step 5: Apply & Test
- Rebuild the SvelteKit project
- Check the new logo, colors, and fonts across pages
- Commit changes with clear messages
