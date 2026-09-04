# 🚀 Building & Releasing Pre-Release Packages

This guide explains how to build and release the pre-release packages on GitHub.

## Option 1: Using GitHub Actions (Recommended)

### Step 1: Trigger the Build Workflow

1. Go to your GitHub repository: https://github.com/iHarryPotter178/rclone-ui-fork
2. Click on **Actions** tab
3. Find **"Build Pre-Release - Ubuntu 26.04"** workflow
4. Click **Run workflow** button
5. Select branch: **iharrypotter178-remove-license-restrictions**
6. (Optional) Enter custom pre-release version
7. Click **Run workflow** button

### Step 2: Monitor the Build

- The workflow will start automatically
- Check the build progress in the Actions tab
- Build typically takes 10-20 minutes
- You'll see logs as it progresses

### Step 3: Download Pre-Release

Once build completes:
1. Go to **Releases** tab
2. You should see a new pre-release: `v3.7.4 - Personal Fork Pre-Release`
3. Download:
   - `rclone-ui_*.deb` - For Ubuntu 26.04 / Debian
   - `rclone-ui_*.AppImage` - For universal Linux

### Step 4: Test the Packages

**For deb package:**
```bash
sudo apt install ./rclone-ui_*.deb
rclone-ui
```

**For AppImage:**
```bash
chmod +x rclone-ui_*.AppImage
./rclone-ui_*.AppImage
```

## Option 2: Manual Trigger via GitHub CLI

```bash
# Make sure you're logged in
gh auth login

# Trigger the workflow
gh workflow run build-prerelease.yml \
  --repo iHarryPotter178/rclone-ui-fork \
  --ref iharrypotter178-remove-license-restrictions
```

## What Gets Built

The workflow creates:

### Files Generated
- **rclone-ui_X.X.X_amd64.deb** - Debian/Ubuntu package
  - Install size: ~150-200 MB
  - Installs to: `/usr/bin/rclone-ui`
  
- **rclone-ui_X.X.X_amd64.AppImage** - Universal Linux AppImage
  - Single executable: ~300-400 MB
  - No installation required, just make executable and run
  - Works on any Linux distro with glibc

### Release Information
- Tagged as pre-release on GitHub
- Includes comprehensive release notes
- Links to documentation and testing checklist
- Available for download from Releases page

## Testing Checklist

After installation, verify these features work:

- [ ] **Open File Preview**
  - Try opening an image or PDF
  - Should display without any "Unlock Pro" overlay

- [ ] **Add Multiple Remotes**
  - Go to Settings → Remotes
  - Add 5+ remote configurations
  - No limit warning should appear

- [ ] **Create Multiple Notifications**
  - Go to Settings → Notifications
  - Add 5+ notification targets
  - No limit warning should appear

- [ ] **Multi-Source Operations**
  - Select 2+ files in the file browser
  - Copy or Move them
  - Should work without any restriction message

- [ ] **Scheduled Tasks**
  - Create multiple scheduled operations
  - No limit should be enforced

- [ ] **UI Check**
  - Open Settings
  - Verify "License" tab is NOT visible
  - Other tabs should work normally

- [ ] **Offline Mode**
  - Disconnect from internet
  - Launch the app
  - Should work without any connection errors

## What's Different in This Pre-Release

This pre-release includes:
- ✅ All license restrictions removed
- ✅ All premium features unlocked
- ✅ Works completely offline
- ✅ No license key required
- ✅ Professional documentation
- ✅ Automated setup scripts

## Troubleshooting

### deb Installation Issues

**Error: "Depends on libwebkit2gtk-4.1"**
```bash
sudo apt install libwebkit2gtk-4.1
sudo apt install ./rclone-ui_*.deb
```

**Error: "File exists in another package"**
```bash
sudo apt install --fix-broken
```

### AppImage Issues

**Permission denied when running**
```bash
chmod +x rclone-ui_*.AppImage
./rclone-ui_*.AppImage
```

**AppImage won't launch**
- Ensure you have FUSE installed: `sudo apt install libfuse2`
- Try extracting and running: `./rclone-ui_*.AppImage --appimage-extract`

### App Won't Start

**Missing rclone binary**
```bash
sudo apt install rclone
# or download from https://rclone.org/downloads/
```

## Workflow Files

### 1. `build-prerelease.yml` (Recommended)
- Manual trigger (workflow_dispatch)
- Ubuntu 24.04 runner
- Builds deb and AppImage
- Creates pre-release automatically
- Full release notes included

### 2. `release-linux.yml` (Alternative)
- Can be triggered manually
- Same build process
- Creates regular release (not pre-release)
- Good for final stable releases

## Next Steps

1. ✅ Trigger the workflow in GitHub Actions
2. ⏳ Wait for build to complete (10-20 minutes)
3. 📥 Download the pre-release packages
4. 🧪 Test both deb and AppImage versions
5. 📝 Document any issues or feedback
6. 🎉 Share with testing team

## Getting Help

For issues with:
- **Building**: See `.github/workflows/build-prerelease.yml`
- **Installation**: See `BUILD_UBUNTU.md`
- **Usage**: See `PERSONAL_FORK_README.md`
- **Technical Details**: See `LICENSE_REMOVAL_SUMMARY.md`

## Links

- [GitHub Actions Dashboard](https://github.com/iHarryPotter178/rclone-ui-fork/actions)
- [Releases Page](https://github.com/iHarryPotter178/rclone-ui-fork/releases)
- [Feature Branch](https://github.com/iHarryPotter178/rclone-ui-fork/tree/iharrypotter178-remove-license-restrictions)
- [Pull Request #1](https://github.com/iHarryPotter178/rclone-ui-fork/pull/1)

---

**Status**: Ready to build  
**Build Time**: ~10-20 minutes  
**Output Formats**: .deb + .AppImage  
**Release Type**: Pre-Release  
