#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SCHEME extends Win32Enum {

    /**
     * Native name: HttpSchemeHttp
     * @type {Integer (Int32)}
     */
    static Http => 0

    /**
     * Native name: HttpSchemeHttps
     * @type {Integer (Int32)}
     */
    static Https => 1

    /**
     * Native name: HttpSchemeMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 2
}
