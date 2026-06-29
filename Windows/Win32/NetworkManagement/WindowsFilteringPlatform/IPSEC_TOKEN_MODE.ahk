#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Different IPsec modes in which a token can be obtained.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ne-ipsectypes-ipsec_token_mode
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TOKEN_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Token was obtained in main mode.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_MODE_MAIN => 0

    /**
     * Token was obtained in extended mode.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_MODE_EXTENDED => 1

    /**
     * Maximum value for testing only.
     * @type {Integer (Int32)}
     */
    static IPSEC_TOKEN_MODE_MAX => 2
}
