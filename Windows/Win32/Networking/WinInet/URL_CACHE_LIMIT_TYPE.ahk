#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class URL_CACHE_LIMIT_TYPE extends Win32Enum {

    /**
     * Native name: UrlCacheLimitTypeIE
     * @type {Integer (Int32)}
     */
    static TypeIE => 0

    /**
     * Native name: UrlCacheLimitTypeIETotal
     * @type {Integer (Int32)}
     */
    static TypeIETotal => 1

    /**
     * Native name: UrlCacheLimitTypeAppContainer
     * @type {Integer (Int32)}
     */
    static AppContainer => 2

    /**
     * Native name: UrlCacheLimitTypeAppContainerTotal
     * @type {Integer (Int32)}
     */
    static AppContainerTotal => 3

    /**
     * Native name: UrlCacheLimitTypeNum
     * @type {Integer (Int32)}
     */
    static Num => 4
}
