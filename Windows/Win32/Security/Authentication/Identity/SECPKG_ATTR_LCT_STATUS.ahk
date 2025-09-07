#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether the token from the most recent call to the InitializeSecurityContext function is the last token from the client.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-secpkg_attr_lct_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_ATTR_LCT_STATUS{

    /**
     * The token is the last token from the client.
     * @type {Integer (Int32)}
     */
    static SecPkgAttrLastClientTokenYes => 0

    /**
     * The token is not the last token from the client.
     * @type {Integer (Int32)}
     */
    static SecPkgAttrLastClientTokenNo => 1

    /**
     * It is not known whether the token is the last token from the client.
     * @type {Integer (Int32)}
     */
    static SecPkgAttrLastClientTokenMaybe => 2
}
