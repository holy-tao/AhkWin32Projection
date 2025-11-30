#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_INTERNET_SCHEME extends Win32Enum{

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
