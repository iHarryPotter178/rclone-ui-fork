# Rclone UI - Personal Fork (License Unrestricted)

> **All premium features unlocked permanently - No license key required!**

This is a personal fork of [rclone-ui](https://github.com/rclone-ui/rclone-ui) with all license restrictions removed. Build it once and run it forever with all features available.

## 🎯 What's Different?

### ✅ Features Unlocked
- **File Previews** - Images, PDFs, documents, spreadsheets, presentations, videos
- **Unlimited Remotes** - No 4-remote limit
- **Unlimited Notifications** - No 4-target limit
- **Multi-Source Operations** - Copy/move multiple sources at once
- **Full Scheduling** - Create unlimited scheduled tasks
- **Complete Config Access** - Manage all rclone configurations

### ✅ Benefits
- 🚀 **No Network Dependency** - Works completely offline
- ⚡ **Faster Startup** - No license validation calls
- 🔒 **Personal Use** - Your own fork, your rules
- 📦 **Permanent License** - Behaves as if forever licensed
- 🎨 **Clean UI** - No license prompts or paywalls

## 📋 Prerequisites

### Automated Setup
```bash
sudo chmod +x setup-build-env.sh
sudo ./setup-build-env.sh
```

### Manual Setup (Ubuntu 26.04 LTS)
```bash
# System dependencies
sudo apt update
sudo apt install -y build-essential libgtk-3-dev libgdk-pixbuf-2.0-dev curl git pkg-config

# Node.js
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Verify installations
node --version && npm --version && rustc --version
```

## 🛠️ Building

### Quick Build
```bash
# Clone and checkout
git clone https://github.com/iHarryPotter178/rclone-ui-fork.git
cd rclone-ui-fork
git checkout iharrypotter178-remove-license-restrictions

# Build
npm install
npm run tauri -- build --target x86_64-unknown-linux-gnu

# Run
./src-tauri/target/release/app
```

### Development Mode
```bash
npm install
npm run dev
```

This starts a dev server with hot reload at `http://localhost:1420`

## 📚 Documentation

- **[BUILD_UBUNTU.md](./BUILD_UBUNTU.md)** - Detailed build instructions & troubleshooting
- **[QUICK_START.md](./QUICK_START.md)** - Quick reference guide
- **[LICENSE_REMOVAL_SUMMARY.md](./LICENSE_REMOVAL_SUMMARY.md)** - Technical implementation details
- **[BUILDING.md](./BUILDING.md)** - Build process overview

## 🚀 Usage

### From Built Binary
```bash
./src-tauri/target/release/app
```

### From Development
```bash
npm run dev
```

### Docker (Optional)
```bash
docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix rclone-ui:personal
```

## 🔧 What Was Changed?

### Code Modifications
1. **`store/persisted.ts`** - Default license state: `licenseValid: true`
2. **`lib/license.ts`** - Validation bypassed (no API calls)
3. **`main.ts`** - Startup validation skipped
4. **`src/pages/Settings/index.tsx`** - License tab hidden

### Lines Changed
```
store/persisted.ts: -3, +3 (license defaults)
lib/license.ts: -95, +16 (removed API calls)
main.ts: -37, +3 (simplified validation)
src/pages/Settings/index.tsx: -1, +1 (hidden tab)
Total: ~130 lines removed, ~25 lines added
```

### Network Calls Removed
- ❌ `POST https://rcloneui.com/api/v2/validate`
- ❌ `POST https://rcloneui.com/api/v1/revoke`
- ❌ Machine UID generation/tracking

## 📦 Build Outputs

After build completes:
- **Binary**: `src-tauri/target/release/app`
- **Debug Binary**: `src-tauri/target/debug/app`
- **AppImage** (if configured): `src-tauri/target/release/bundle/appimage/`
- **Debian Package** (if configured): `src-tauri/target/release/bundle/deb/`

## 🎮 Testing Features

Verify that features are unlocked:

1. **File Preview**
   - Open any image, PDF, or document
   - No "Unlock Pro" overlay should appear

2. **Multiple Remotes**
   - Go to Settings → Remotes
   - Add 5+ remote configurations
   - No limit warning should appear

3. **Notifications**
   - Go to Settings → Notifications
   - Add 5+ notification targets
   - No limit warning should appear

4. **Copy/Move Multiple Sources**
   - Select 2+ files/folders
   - Copy or Move them
   - Should work without restriction

5. **Scheduled Tasks**
   - Create multiple scheduled operations
   - No limit on number of schedules

## ⚙️ Build Options

### Release Build (Optimized)
```bash
npm run tauri -- build --target x86_64-unknown-linux-gnu
```

### Debug Build (Development)
```bash
npm run tauri -- build --target x86_64-unknown-linux-gnu --debug
```

### ARM64 (Raspberry Pi, etc.)
```bash
npm run build:linux:arm
```

### Other Platforms
```bash
npm run build:mac              # macOS (Silicon/Intel)
npm run build:windows          # Windows
```

## 🐛 Troubleshooting

### Build Fails: "linker not found"
```bash
sudo apt install build-essential
```

### Build Fails: "gdk-3.0 not found"
```bash
sudo apt install libgtk-3-dev libgdk-pixbuf-2.0-dev
```

### Build Fails: "pkg-config not found"
```bash
sudo apt install pkg-config
```

### App Won't Start
```bash
# Install rclone separately
sudo apt install rclone

# Or from source
https://rclone.org/downloads/
```

### npm version warnings
These are safe to ignore - build will proceed anyway.

## 📖 Related Documentation

- [Tauri Documentation](https://tauri.app/) - Framework used
- [Rclone Documentation](https://rclone.org/docs/) - Backend CLI
- [Original Project](https://github.com/rclone-ui/rclone-ui) - Source
- [Node.js LTS](https://nodejs.org/) - Runtime
- [Rust Book](https://doc.rust-lang.org/book/) - Backend language

## 📝 License

- **This Fork**: Personal use modifications (2026)
- **Original Project**: Apache License 2.0
- **Dependencies**: Various (see package.json and Cargo.toml)

## ⚠️ Important Notes

- **Personal Use Only** - This fork removes licensing restrictions
- **Network Independent** - Works completely offline
- **Perpetual License** - Behaves as if licensed forever
- **No Phone Home** - Zero tracking or license validation calls

## 🤝 Contributing

This is a personal fork for testing and personal use. For contributions to the original project, see [rclone-ui/rclone-ui](https://github.com/rclone-ui/rclone-ui).

## 📧 Support

For build issues specific to this fork:
1. Check [BUILD_UBUNTU.md](./BUILD_UBUNTU.md) troubleshooting section
2. Check [QUICK_START.md](./QUICK_START.md) for common tasks
3. Ensure all dependencies from [setup-build-env.sh](./setup-build-env.sh) are installed

For rclone-related questions:
- [Rclone Forum](https://forum.rclone.org/)
- [Rclone GitHub Issues](https://github.com/rclone/rclone/issues)

## 🎉 Getting Started

1. **Install Dependencies**
   ```bash
   sudo chmod +x setup-build-env.sh
   sudo ./setup-build-env.sh
   ```

2. **Build the Application**
   ```bash
   npm install
   npm run tauri -- build --target x86_64-unknown-linux-gnu
   ```

3. **Run the Application**
   ```bash
   ./src-tauri/target/release/app
   ```

4. **Enjoy Unlimited Features!**
   - All features work without license
   - No network calls to licensing servers
   - Works offline and permanently

---

**Happy rclone'ing!** 🚀

