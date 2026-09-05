#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_INTERNET_SCHEME extends Win32Enum {

    /**
     * Native name: WINHTTP_INTERNET_SCHEME_HTTP
     * @type {Integer (Int32)}
     */
    static HTTP => 1

    /**
     * Native name: WINHTTP_INTERNET_SCHEME_HTTPS
     * @type {Integer (Int32)}
     */
    static HTTPS => 2

    /**
     * Native name: WINHTTP_INTERNET_SCHEME_FTP
     * @type {Integer (Int32)}
     */
    static FTP => 3

    /**
     * Native name: WINHTTP_INTERNET_SCHEME_SOCKS
     * @type {Integer (Int32)}
     */
    static SOCKS => 4
}
