#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * An access token principal.
 * @see https://docs.microsoft.com/windows/win32/api//ipsectypes/ne-ipsectypes-ipsec_token_principal
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_TOKEN_PRINCIPAL extends Win32Enum{

    /**
     * The principal for the IPsec access token is "Local".
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_PRINCIPAL_LOCAL => 0

    /**
     * The principal for the IPsec access token is "Peer".
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_PRINCIPAL_PEER => 1

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_PRINCIPAL_MAX => 2
}
