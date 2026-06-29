#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_OPEN_REQUEST_FLAGS {
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
    static WINHTTP_FLAG_BYPASS_PROXY_CACHE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ESCAPE_DISABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ESCAPE_DISABLE_QUERY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_ESCAPE_PERCENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_NULL_CODEPAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_REFRESH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WINHTTP_FLAG_SECURE => 8388608
}
