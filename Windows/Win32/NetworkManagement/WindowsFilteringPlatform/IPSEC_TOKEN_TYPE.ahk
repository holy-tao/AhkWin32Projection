#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * An IPsec token type.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_token_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TOKEN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
