# Building Rclone UI (Personal Fork) for Ubuntu 26.04 LTS

This is a personal fork of rclone-ui with all license restrictions removed. All features are permanently unlocked.

## Prerequisites

### System Dependencies

**Easy Method** - Use the provided setup script:
```bash
sudo chmod +x setup-build-env.sh
sudo ./setup-build-env.sh
```

**Manual Installation**:
```bash
sudo apt update
sudo apt install -y \
  build-essential \
  curl \
  wget \
  git \
  libssl-dev \
  pkg-config \
  clang \
  libclang-dev \
  llvm \
  libgtk-3-dev \
  libgdk-pixbuf-2.0-dev \
  libxcb-render0-dev \
  libxcb-shape0-dev \
  libxcb-xfixes0-dev \
  libxkbcommon-dev \
  libpango-1.0-0 \
  libpangoft2-1.0-0 \
  libglib2.0-0 \
  appindicator3-0.1 \
  libappindicator3-1
```

**Note**: The `libgdk-pixbuf-2.0-dev` and other GTK3 development files are critical for the Tauri GUI build.

### Node.js and npm
Install Node.js 22+ with npm:

```bash
# Using NodeSource repository (recommended)
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify installation
node --version
npm --version
```

### Rust Toolchain
Install Rust via rustup:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Verify installation
rustc --version
cargo --version

# Ensure correct Rust version (1.77.2 or compatible)
rustup update
```

### Additional Build Tools
```bash
sudo apt install -y \
  clang \
  libclang-dev \
  llvm
```

## Building

### 1. Clone/Prepare Repository
```bash
# If you're starting fresh:
git clone https://github.com/iHarryPotter178/rclone-ui-fork.git
cd rclone-ui-fork
git checkout iharrypotter178-remove-license-restrictions

# If you already have the repo:
cd rclone-ui-fork
git pull origin iharrypotter178-remove-license-restrictions
```

### 2. Install Dependencies
```bash
npm install
```

### 3. Build for Ubuntu Linux (x86_64)

#### For Development (debug build with symbols):
```bash
npm run build:linux:arm
```

Or directly with Tauri:
```bash
npm run tauri -- build --target x86_64-unknown-linux-gnu --debug
```

#### For Release (optimized build):
```bash
npm run build  # This builds the frontend first
npm run tauri -- build --target x86_64-unknown-linux-gnu
```

The release binary will be in: `src-tauri/target/release/app` (Linux binary)

### 4. Build Output

After successful build, you'll find:
- **Binary**: `src-tauri/target/release/app`
- **AppImage**: `src-tauri/target/release/bundle/appimage/rclone-ui_*.AppImage` (if configured)
- **Debian Package**: `src-tauri/target/release/bundle/deb/` (if configured)

## Running

### From Source (Development)
```bash
npm run dev
```

### From Built Binary
```bash
./src-tauri/target/release/app
```

### From AppImage (if built)
```bash
chmod +x rclone-ui_*.AppImage
./rclone-ui_*.AppImage
```

## Features Unlocked

This personal fork has all license restrictions removed:
- ✅ File previews (images, PDFs, documents, spreadsheets)
- ✅ Unlimited notification targets
- ✅ Unlimited remote configurations
- ✅ Multi-source copy and move operations
- ✅ Advanced scheduling features
- ✅ All configuration options

No license key needed!

## Troubleshooting

### Build Failures

**Issue**: `error: failed to load manifest for workspace member`
- Solution: Run `npm install` to ensure all dependencies are installed

**Issue**: `error: linker 'cc' not found`
- Solution: Install build-essential: `sudo apt install build-essential`

**Issue**: Tauri/webkit errors
- Solution: Ensure GTK3 dev files are installed: `sudo apt install libgtk-3-dev`

**Issue**: npm version mismatch warnings
- These are usually safe to ignore; the build should proceed anyway

### Runtime Issues

**Issue**: App won't start or missing rclone binary
- Ensure rclone is installed: `sudo apt install rclone` or download from https://rclone.org/downloads/

**Issue**: GUI doesn't appear
- Check that you have a display server running (X11 or Wayland)

## Development Notes

### Code Structure
- **Frontend**: TypeScript/React in root directory (`src/`, `main.ts`, etc.)
- **Backend**: Rust in `src-tauri/` using Tauri framework
- **Store**: Persisted state in `store/persisted.ts`

### License Removal Implementation
The following changes were made to remove license restrictions:
1. `store/persisted.ts`: Set `licenseValid: true` by default
2. `lib/license.ts`: Bypass API validation calls
3. `main.ts`: Skip license validation on startup
4. `src/pages/Settings/index.tsx`: Hide license settings tab

### Building for Other Architectures

**ARM64 (aarch64)**:
```bash
npm run build:linux:arm
```

**Apple Silicon (M1/M2)**:
```bash
npm run build:mac
```

**Intel Mac**:
```bash
npm run build:mac:intel
```

**Windows**:
```bash
npm run build:windows
```

## Additional Resources

- [Tauri Documentation](https://tauri.app/)
- [Rclone Documentation](https://rclone.org/docs/)
- [Original rclone-ui Repository](https://github.com/rclone-ui/rclone-ui)
