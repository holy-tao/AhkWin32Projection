#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WinHttpRequestSslErrorFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_UnknownCA => 256

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_CertWrongUsage => 512

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_CertCNInvalid => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_CertDateInvalid => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SslErrorFlag_Ignore_All => 13056
}
