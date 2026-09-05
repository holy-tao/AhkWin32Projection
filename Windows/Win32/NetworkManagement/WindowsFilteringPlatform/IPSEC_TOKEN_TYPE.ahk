#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An IPsec token type.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_token_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_TOKEN_TYPE extends Win32Enum {

    /**
     * Machine token.
     * Native name: IPSEC_TOKEN_TYPE_MACHINE
     * @type {Integer (Int32)}
     */
    static MACHINE => 0

    /**
     * Impersonation token.
     * Native name: IPSEC_TOKEN_TYPE_IMPERSONATION
     * @type {Integer (Int32)}
     */
    static IMPERSONATION => 1

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_TOKEN_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
