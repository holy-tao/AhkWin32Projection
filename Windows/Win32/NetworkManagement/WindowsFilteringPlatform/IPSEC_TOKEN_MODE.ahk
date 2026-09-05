#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Different IPsec modes in which a token can be obtained.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_token_mode
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_TOKEN_MODE extends Win32Enum {

    /**
     * Token was obtained in main mode.
     * Native name: IPSEC_TOKEN_MODE_MAIN
     * @type {Integer (Int32)}
     */
    static MAIN => 0

    /**
     * Token was obtained in extended mode.
     * Native name: IPSEC_TOKEN_MODE_EXTENDED
     * @type {Integer (Int32)}
     */
    static EXTENDED => 1

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_TOKEN_MODE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
