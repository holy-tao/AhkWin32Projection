#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERT_AUTH {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_FLAG_SSL_ONE_WAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_ENABLE_CRL_CHECK_STRONG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_DISABLE_SSL_CERT_VALIDATION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_ALLOW_HTTP_CERT_LOOKUP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_CERT_AUTH_URL_CONTAINS_BUNDLE => 32
}
