# ESP32 Wi-Fi & WebSocket Template with Qwen3‑Coder

This template provides a ready-to-use GitHub starter for ESP32 projects powered by Qwen3‑Coder as your development assistant.

## Features

- **Firmware**: ESP-IDF project with LittleFS for hosting a compressed SvelteKit web app and a WebSocket-based LED control demo.
- **Frontend**: Pre-scaffolded SvelteKit + Tailwind CSS + DaisyUI web app, including Wi‑Fi config page and an interactive LED toggle page.
- **Build Scripts**: `buildsite.sh` (build frontend) and `runsite.sh` (run dev server).
- **Qwen3‑Coder Integration**: `.aider.conf.yml` included for API key config via `QWEN3_API_KEY`.
- **Documentation**: Comprehensive README with setup & Qwen Quickstart for students.

## Repository Structure

```text
wifi_config_qwen_template/
├── CMakeLists.txt            # ESP-IDF project
├── partitions.csv            # LittleFS partition for web files
├── main/                     # ESP32 firmware code (Wi‑Fi + WebSocket server)
├── components/               # Custom components (filesystem, settings, server, etc.)
├── web/                      # SvelteKit frontend app
├── buildsite.sh              # Build frontend for LittleFS
├── runsite.sh                # Start frontend dev server
├── .aider.conf.yml           # Qwen3‑Coder plugin config
└── README.md                 # This documentation
```

## Prerequisites

- [ESP-IDF](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/get-started/) installed and configured.
- [Node.js](https://nodejs.org/) (v16+)
- Qwen3‑Coder VS Code extension or [MCP client](https://modelscope.cn/products/detail/4) for local use.

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/wifi_config_qwen_template.git
   cd wifi_config_qwen_template
   ```

2. **Frontend Development**
   ```bash
   ./runsite.sh
   ```
   This starts SvelteKit on http://localhost:3000 for rapid UI development.

3. **Flash the Firmware**
   Configure Wi‑Fi credentials in the web UI, then build & flash:
   ```bash
   idf.py set-target esp32
   idf.py menuconfig  # adjust settings if needed
   idf.py build flash monitor
   ```

## Qwen3‑Coder Quickstart for Students

Leverage Qwen3‑Coder to extend the UI or firmware without leaving VS Code.

### VS Code Setup
- Install the **Qwen3‑Coder** extension in VS Code.
- Set your API key:
  1. Open command palette: `Ctrl+Shift+P`
  2. Search **Qwen3‑Coder: Set API Key**
  3. Paste your `QWEN3_API_KEY`.

### Example Prompts
- **Add a temperature graph page**: _"Qwen, add a new page in the frontend that displays a live temperature graph using WebSocket."_
- **Multi-device support**: _"Extend the WebSocket server to handle multiple clients and have Qwen update the ESP32 code."_

### Aider (Optional)
You can also use **Aider** CLI with `.aider.conf.yml`:
```bash
aider --dev
```

## Next Steps

- Customize the UI theme with DaisyUI.
- Integrate additional sensors and create new WebSocket endpoints.
- Use Qwen3‑Coder to refactor code or add features iteratively.

