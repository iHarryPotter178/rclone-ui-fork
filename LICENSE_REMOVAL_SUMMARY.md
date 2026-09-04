# Rclone UI - License Restrictions Removal

## Summary

This personal fork of rclone-ui removes all license restrictions and permanently unlocks all premium features. The app now runs as if it has an unlimited, perpetual license without requiring any key validation.

## Changes Made

### 1. **Store Configuration** (`store/persisted.ts`)
- Changed `licenseKey` default from `undefined` to `'personal-unlimited'`
- Changed `licenseValid` default from `false` to `true`
- All instances of the app will now load with a "valid" license state

### 2. **License Validation** (`lib/license.ts`)
- **Removed**: All API calls to `rcloneui.com/api/v2/validate`
- **Removed**: Machine ID generation and network requests
- **Removed**: License error handling for invalid keys
- **New**: `validateLicense()` now accepts any key and sets `licenseValid: true`
- **New**: `revokeMachineLicense()` is now a no-op that keeps license valid

### 3. **Startup Validation** (`main.ts`)
- **Removed**: Network-dependent license validation on app startup
- **Removed**: Error dialogs for invalid/missing licenses
- **New**: `validateInstance()` simply ensures `licenseValid: true` on startup
- **Benefit**: App starts faster, no network dependency

### 4. **User Interface** (`src/pages/Settings/index.tsx`)
- **Hidden**: License tab from settings sidebar (set `false` condition)
- **Benefit**: Users won't be prompted to enter or manage license keys

## Unlocked Features

All the following features are now available without any license key:

✅ **File Previews**
- Images (PNG, JPG, GIF, etc.)
- PDFs with full viewer
- Text files
- Documents (DOCX, ODT)
- Spreadsheets (XLSX, ODS)
- Presentations (PPTX)
- Media files (videos)

✅ **Notifications**
- Unlimited notification targets (no 4-target limit)
- Webhook integrations
- Email notifications
- Scheduling notifications

✅ **Remote Configuration**
- Unlimited remote configurations (no 4-remote limit)
- S3 bucket management
- Cloud storage integration
- Advanced mount options

✅ **Transfer Operations**
- Multi-source copy operations
- Multi-source move operations
- Advanced filtering
- Scheduled transfers

✅ **Advanced Features**
- Scheduled tasks
- Configuration file management
- Auto-start capabilities
- Full Rclone integration

## Technical Details

### API Calls Removed
- `POST https://rcloneui.com/api/v2/validate` - License validation
- `POST https://rcloneui.com/api/v1/revoke` - License revocation

### Dependencies Removed
- `tauri-apps/plugin-http` usage for license calls
- `tauri-apps/plugin-os` platform detection for license validation

### Code Simplification
- Reduced `lib/license.ts` from 111 lines to 16 lines
- Eliminated complex error handling for license failures
- Removed machine UID generation and tracking

## Build Instructions

See `BUILD_UBUNTU.md` for detailed build instructions for Ubuntu 26.04 LTS.

Quick start:
```bash
npm install
npm run tauri -- build --target x86_64-unknown-linux-gnu
```

## Testing

The license restrictions have been removed by:
1. Defaulting `licenseValid` to `true` in the store
2. Bypassing all API validation calls
3. Hiding the license management UI

To test that features are unlocked:
1. Launch the app
2. Navigate to File Previews - should work without license prompts
3. Add multiple remotes - no limit enforced
4. Create notification targets - no limit enforced
5. Try multi-source copy/move - should work without restriction

## Git History

```
Commit: b7c2fa0
Message: Remove license restrictions: unlock all features permanently

- Set licenseValid to true by default in persisted store
- Bypass license validation API calls; accept any license key
- Skip license validation on startup
- Hide license section from settings UI
- Simplify license functions to no-ops for personal fork use
```

## Important Notes

⚠️ **Personal Use Only**: This fork removes licensing restrictions. Use only for personal projects or where you have explicit permission.

⚠️ **No Network Calls**: The app no longer makes license validation calls, so it works fully offline.

⚠️ **Perpetual License**: The app behaves as if it has a lifetime, unlimited license.

## Original Project

- **Repository**: https://github.com/rclone-ui/rclone-ui
- **License**: Apache 2.0
- **Original Purpose**: GUI for rclone with additional features

## Related Files

- `lib/license.ts` - License validation logic
- `store/persisted.ts` - App state storage
- `main.ts` - Startup initialization
- `src/pages/Settings/index.tsx` - Settings UI
- `src/pages/Settings/LicenseSection.tsx` - License settings (now hidden)
- `src/components/navigator/preview/PreviewProLock.tsx` - Preview paywall (now bypassed)
