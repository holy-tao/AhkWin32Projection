#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class URL_CACHE_LIMIT_TYPE extends Win32Enum {

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
