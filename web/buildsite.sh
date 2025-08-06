#!/bin/bash
set -e

echo "[buildsite] Installing/updating node modules"
npm install

echo "[buildsite] Building SvelteKit static site..."
npm run build

echo "[buildsite] Optimizing build/ assets (.js, .css, .html, .json) for GZIP deploy..."
# Gzip all files the webserver can serve (js, css, html, svg, json) ONLY after all pruning is complete
find build -type f \( -name "*.js" -o -name "*.css" -o -name "*.html" -o -name "*.json" \) -exec gzip -9 -f {} \;
# Remove the original uncompressed files to save flash space
find build -type f \( -name "*.js" -o -name "*.css" -o -name "*.html" -o -name "*.json" \) ! -name "*.gz" -exec rm {} \;

echo "[buildsite] Optionally optimizing images in build/img (requires imagemin-cli; install locally) ..."
# image compression didnt do anything useful, so commented out
#npx imagemin build/img/*.{png,jpg,jpeg,webp} --out-dir=build/img/ --plugin=pngquant --plugin=mozjpeg --plugin=webp

echo "[buildsite] SvelteKit app is built and optimized in sksrc/build (flash this directory to LittleFS)."
