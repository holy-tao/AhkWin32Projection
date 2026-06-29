#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the token from the most recent call to the InitializeSecurityContext function is the last token from the client.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-secpkg_attr_lct_status
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_ATTR_LCT_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
