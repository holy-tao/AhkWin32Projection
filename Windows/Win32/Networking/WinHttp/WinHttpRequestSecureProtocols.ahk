#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WinHttpRequestSecureProtocols {
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
    static SecureProtocol_SSL2 => 8

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_SSL3 => 32

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_TLS1 => 128

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_TLS1_1 => 512

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_TLS1_2 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SecureProtocol_ALL => 168
}
