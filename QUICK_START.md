# Quick Start Guide - Rclone UI Personal Fork

## What's Different?

This is a modified version of rclone-ui with all license restrictions removed. Everything works as if you have a permanent, unlimited license.

## Features Unlocked

All premium features are now available:
- File previews (images, PDFs, documents, videos)
- Unlimited notification targets
- Unlimited remote configurations  
- Multi-source copy/move operations
- Scheduled tasks
- Full configuration access

## Prerequisites for Ubuntu 26.04 LTS

```bash
# Install system dependencies
sudo apt update
sudo apt install -y build-essential curl wget git libssl-dev pkg-config libgtk-3-dev

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
```

## Building

```bash
# Clone the repository
git clone https://github.com/iHarryPotter178/rclone-ui-fork.git
cd rclone-ui-fork
git checkout iharrypotter178-remove-license-restrictions

# Install npm dependencies
npm install

# Build for Linux x86_64
npm run tauri -- build --target x86_64-unknown-linux-gnu

# Binary location: src-tauri/target/release/app
./src-tauri/target/release/app
```

## Running from Source (Dev Mode)

```bash
npm run dev
```

This will start the development server with hot reload.

## What Was Changed?

1. **Default License State** - App starts as if licensed
2. **Validation Bypassed** - No API calls to check license
3. **No Network Required** - Works completely offline
4. **UI Simplified** - License settings tab hidden

For detailed changes, see `LICENSE_REMOVAL_SUMMARY.md`
For build instructions, see `BUILD_UBUNTU.md`

## File Structure

```
rclone-ui-fork/
├── src/                    # React frontend code
│   ├── pages/             # Page components
│   └── components/        # Reusable components
├── lib/                   # Utilities (license.ts modified)
├── store/                 # State management (persisted.ts modified)
├── src-tauri/             # Rust backend
│   └── src/               # Tauri commands
├── main.ts                # App entry point (modified)
├── BUILD_UBUNTU.md        # Detailed build guide
└── LICENSE_REMOVAL_SUMMARY.md  # Changes summary
```

## Common Commands

```bash
# Development
npm run dev                          # Start dev server

# Building
npm install                          # Install dependencies
npm run tauri -- build              # Full build
npm run tauri -- build --debug      # Debug build

# Formatting/Linting
npm run format                      # Format code
npm run lint                        # Lint check

# Info
npm run info                        # Show system info
tauri info                          # Show Tauri info
```

## Troubleshooting

### Build fails with "linker not found"
```bash
sudo apt install build-essential
```

### App won't start / missing GTK
```bash
sudo apt install libgtk-3-dev
```

### npm/node version issues
These are usually safe to ignore and won't prevent the build from working.

## Next Steps

1. Review `BUILD_UBUNTU.md` for detailed build instructions
2. Review `LICENSE_REMOVAL_SUMMARY.md` for what was changed
3. Run `npm install` to download dependencies
4. Build with `npm run tauri -- build --target x86_64-unknown-linux-gnu`
5. Run the built binary or use `npm run dev` for development

## Performance Tips

- For faster builds: use debug builds with `--debug` flag
- Development mode with `npm run dev` supports hot reload for quick iteration
- Release builds (`--release` or no flag) create optimized binaries

## Note on Dependencies

This app requires rclone to be installed separately. Install it with:
```bash
sudo apt install rclone
```

Or download from: https://rclone.org/downloads/
