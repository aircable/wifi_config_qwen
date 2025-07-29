#!/usr/bin/env bash
set -euo pipefail

echo "Starting SvelteKit development server..."
cd web
npm install
npm run dev -- --host 0.0.0.0 --port 3000
