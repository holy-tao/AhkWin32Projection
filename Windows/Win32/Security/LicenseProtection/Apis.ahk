#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.LicenseProtection
 * @version v4.0.30319
 */
class LicenseProtection {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {PWSTR} licenseKey 
     * @param {Integer} validityInDays 
     * @returns {Integer} 
     */
    static RegisterLicenseKeyWithExpiration(licenseKey, validityInDays) {
        licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

        result := DllCall("licenseprotection.dll\RegisterLicenseKeyWithExpiration", "ptr", licenseKey, "uint", validityInDays, "int*", &status := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status
    }

    /**
     * 
     * @param {PWSTR} licenseKey 
     * @param {Pointer<FILETIME>} notValidBefore 
     * @param {Pointer<FILETIME>} notValidAfter 
     * @returns {Integer} 
     */
    static ValidateLicenseKeyProtection(licenseKey, notValidBefore, notValidAfter) {
        licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

        result := DllCall("licenseprotection.dll\ValidateLicenseKeyProtection", "ptr", licenseKey, "ptr", notValidBefore, "ptr", notValidAfter, "int*", &status := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return status
    }

;@endregion Methods
}
