#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SCHEME {
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
    static HttpSchemeHttp => 0

    /**
     * @type {Integer (Int32)}
     */
    static HttpSchemeHttps => 1

    /**
     * @type {Integer (Int32)}
     */
    static HttpSchemeMaximum => 2
}
