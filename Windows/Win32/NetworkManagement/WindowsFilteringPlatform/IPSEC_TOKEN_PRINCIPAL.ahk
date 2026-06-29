#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An access token principal.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_token_principal
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TOKEN_PRINCIPAL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
