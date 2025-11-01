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
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     */
    static RegisterLicenseKeyWithExpiration(licenseKey, validityInDays, status) {
        licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

        statusMarshal := status is VarRef ? "int*" : "ptr"

        result := DllCall("licenseprotection.dll\RegisterLicenseKeyWithExpiration", "ptr", licenseKey, "uint", validityInDays, statusMarshal, status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} licenseKey 
     * @param {Pointer<FILETIME>} notValidBefore 
     * @param {Pointer<FILETIME>} notValidAfter 
     * @param {Pointer<Integer>} status 
     * @returns {HRESULT} 
     */
    static ValidateLicenseKeyProtection(licenseKey, notValidBefore, notValidAfter, status) {
        licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

        statusMarshal := status is VarRef ? "int*" : "ptr"

        result := DllCall("licenseprotection.dll\ValidateLicenseKeyProtection", "ptr", licenseKey, "ptr", notValidBefore, "ptr", notValidAfter, statusMarshal, status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
