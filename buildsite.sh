#!/usr/bin/env bash
set -euo pipefail

echo "Building frontend..."
cd web
npm install
npm run build
cd - >/dev/null
echo "Frontend built successfully. Output is in web/build."
