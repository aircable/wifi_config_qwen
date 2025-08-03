#!/bin/bash
set -e

LOGO="branding/final_logo.svg"
STATIC_DIR="web/static"
TW_CONFIG="web/tailwind.config.cjs"
DAISYUI_THEME="web/daisyui.theme.json"

if [ ! -f "$LOGO" ]; then
  echo "Logo not found at $LOGO"
  exit 1
fi

echo "Generating favicon and app icons..."
mkdir -p $STATIC_DIR
convert -background none -resize 32x32 "$LOGO" "$STATIC_DIR/favicon-32x32.png"
convert -background none -resize 16x16 "$LOGO" "$STATIC_DIR/favicon-16x16.png"
convert -background none -resize 192x192 "$LOGO" "$STATIC_DIR/icon-192x192.png"
convert "$STATIC_DIR/favicon-32x32.png" "$STATIC_DIR/favicon.ico"

echo "Updating Tailwind and DaisyUI theme..."
cat > $DAISYUI_THEME <<EOL
{
  "themes": [
    {
      "custom": {
        "primary": "#1E40AF",
        "secondary": "#F59E0B",
        "accent": "#10B981",
        "neutral": "#111827",
        "base-100": "#FFFFFF"
      }
    }
  ]
}
EOL

echo "Branding integration complete."
