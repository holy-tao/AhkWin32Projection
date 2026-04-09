#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.LicenseProtection
 */
class LicenseProtection {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} licenseKey 
     * @param {Integer} validityInDays 
     * @returns {LicenseProtectionStatus} 
     */
    static RegisterLicenseKeyWithExpiration(licenseKey, validityInDays) {
        licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

        result := DllCall("licenseprotection.dll\RegisterLicenseKeyWithExpiration", "ptr", licenseKey, "uint", validityInDays, "int*", &_status := 0, "HRESULT")
        return _status
    }

    /**
     * 
     * @param {PWSTR} licenseKey 
     * @param {Pointer<FILETIME>} notValidBefore 
     * @param {Pointer<FILETIME>} notValidAfter 
     * @returns {LicenseProtectionStatus} 
     */
    static ValidateLicenseKeyProtection(licenseKey, notValidBefore, notValidAfter) {
        licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

        result := DllCall("licenseprotection.dll\ValidateLicenseKeyProtection", "ptr", licenseKey, "ptr", notValidBefore, "ptr", notValidAfter, "int*", &_status := 0, "HRESULT")
        return _status
    }

;@endregion Methods
}
