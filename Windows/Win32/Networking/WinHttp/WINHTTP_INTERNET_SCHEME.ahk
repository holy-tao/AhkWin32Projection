#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_INTERNET_SCHEME {
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
    static WINHTTP_INTERNET_SCHEME_HTTP => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINHTTP_INTERNET_SCHEME_HTTPS => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINHTTP_INTERNET_SCHEME_FTP => 3

    /**
     * @type {Integer (Int32)}
     */
    static WINHTTP_INTERNET_SCHEME_SOCKS => 4
}
