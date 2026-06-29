#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\LicenseProtectionStatus.ahk" { LicenseProtectionStatus }

/**
 * @namespace Windows.Win32.Security.LicenseProtection
 */

;@region Functions
/**
 * 
 * @param {PWSTR} licenseKey 
 * @param {Integer} validityInDays 
 * @returns {LicenseProtectionStatus} 
 */
export RegisterLicenseKeyWithExpiration(licenseKey, validityInDays) {
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
export ValidateLicenseKeyProtection(licenseKey, notValidBefore, notValidAfter) {
    licenseKey := licenseKey is String ? StrPtr(licenseKey) : licenseKey

    result := DllCall("licenseprotection.dll\ValidateLicenseKeyProtection", "ptr", licenseKey, FILETIME.Ptr, notValidBefore, FILETIME.Ptr, notValidAfter, "int*", &_status := 0, "HRESULT")
    return _status
}

;@endregion Functions
