#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An access token principal.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_token_principal
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_TOKEN_PRINCIPAL extends Win32Enum {

    /**
     * The principal for the IPsec access token is "Local".
     * Native name: IPSEC_TOKEN_PRINCIPAL_LOCAL
     * @type {Integer (Int32)}
     */
    static LOCAL => 0

    /**
     * The principal for the IPsec access token is "Peer".
     * Native name: IPSEC_TOKEN_PRINCIPAL_PEER
     * @type {Integer (Int32)}
     */
    static PEER => 1

    /**
     * Maximum value for testing only.
     * Native name: IPSEC_TOKEN_PRINCIPAL_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2
}
