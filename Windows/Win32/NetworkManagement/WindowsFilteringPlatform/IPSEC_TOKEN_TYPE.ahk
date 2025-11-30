#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An IPsec token type.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ne-ipsectypes-ipsec_token_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TOKEN_TYPE extends Win32Enum{

    /**
     * Machine token.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_TYPE_MACHINE => 0

    /**
     * Impersonation token.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_TYPE_IMPERSONATION => 1

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_TYPE_MAX => 2
}
