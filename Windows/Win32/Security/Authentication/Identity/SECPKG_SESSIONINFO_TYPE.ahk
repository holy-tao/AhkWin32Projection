#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the format of session information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_sessioninfo_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_SESSIONINFO_TYPE{

    /**
     * The session information is contained in a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_primary_cred">SECPKG_PRIMARY_CRED</a> structure.
     * @type {Integer (Int32)}
     */
    static SecSessionPrimaryCred => 0
}
