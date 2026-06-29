#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by ISearchManager to state proxy use.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-proxy_access
 * @namespace Windows.Win32.System.Search
 */
export default struct PROXY_ACCESS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use proxy as set by Internet settings.
     * @type {Integer (Int32)}
     */
    static PROXY_ACCESS_PRECONFIG => 0

    /**
     * Do not use a proxy.
     * @type {Integer (Int32)}
     */
    static PROXY_ACCESS_DIRECT => 1

    /**
     * Use the specified proxy.
     * @type {Integer (Int32)}
     */
    static PROXY_ACCESS_PROXY => 2
}
