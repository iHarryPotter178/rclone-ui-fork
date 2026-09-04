import { invoke } from '@tauri-apps/api/core'
import { usePersistedStore } from '../store/persisted'

export async function validateLicense(licenseKey: string) {
    // Personal fork: always accept any license key
    console.log('[validateLicense] personal fork mode - accepting license key')
    usePersistedStore.setState({ licenseKey, licenseValid: true })
    console.log('[validateLicense] license validated')
}

export async function revokeMachineLicense(licenseKey: string) {
    // Personal fork: no-op for revoke
    console.log('[revokeMachineLicense] personal fork mode - no-op')
    usePersistedStore.setState({ licenseKey: 'personal-unlimited', licenseValid: true })
    console.log('[revokeMachineLicense] revoke processed')
}
