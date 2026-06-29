#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct URL_CACHE_LIMIT_TYPE {
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
    static UrlCacheLimitTypeIE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UrlCacheLimitTypeIETotal => 1

    /**
     * @type {Integer (Int32)}
     */
    static UrlCacheLimitTypeAppContainer => 2

    /**
     * @type {Integer (Int32)}
     */
    static UrlCacheLimitTypeAppContainerTotal => 3

    /**
     * @type {Integer (Int32)}
     */
    static UrlCacheLimitTypeNum => 4
}
