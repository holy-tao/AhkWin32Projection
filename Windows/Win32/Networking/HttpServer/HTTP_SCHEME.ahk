#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SCHEME extends Win32Enum{

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
