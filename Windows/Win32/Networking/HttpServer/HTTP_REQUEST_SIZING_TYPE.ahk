#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_REQUEST_SIZING_TYPE {
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
    static HttpRequestSizingTypeTlsHandshakeLeg1ClientData => 0

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg1ServerData => 1

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg2ClientData => 2

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeTlsHandshakeLeg2ServerData => 3

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeHeaders => 4

    /**
     * @type {Integer (Int32)}
     */
    static HttpRequestSizingTypeMax => 5
}
