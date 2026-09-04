#!/bin/bash
# setup-build-env.sh - Setup build environment for rclone-ui on Ubuntu 26.04 LTS

set -e

echo "========================================="
echo "Rclone UI Build Environment Setup"
echo "Ubuntu 26.04 LTS"
echo "========================================="
echo ""

# Check if running with sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo"
   echo "Usage: sudo ./setup-build-env.sh"
   exit 1
fi

echo "[1/4] Updating package lists..."
apt update > /dev/null

echo "[2/4] Installing system dependencies..."
apt install -y \
  build-essential \
  curl \
  wget \
  git \
  pkg-config \
  libssl-dev \
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
  libappindicator3-1 \
  2>&1 | grep -E "Setting up|Processing" || true

echo "[3/4] Installing Node.js 22..."
if ! command -v node &> /dev/null; then
  curl -fsSL https://deb.nodesource.com/setup_22.x | bash - > /dev/null
  apt install -y nodejs 2>&1 | grep -E "Setting up|Processing" || true
fi

echo "[4/4] Installing Rust..."
if ! command -v cargo &> /dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y > /dev/null
  source $HOME/.cargo/env
fi

echo ""
echo "========================================="
echo "Installation Complete!"
echo "========================================="
echo ""
echo "Versions:"
echo "  Node.js: $(node --version)"
echo "  npm: $(npm --version)"
echo "  Rust: $(rustc --version)"
echo "  Cargo: $(cargo --version)"
echo ""
echo "Next steps:"
echo "  1. cd rclone-ui-fork"
echo "  2. git checkout iharrypotter178-remove-license-restrictions"
echo "  3. npm install"
echo "  4. npm run tauri -- build --target x86_64-unknown-linux-gnu"
echo ""
