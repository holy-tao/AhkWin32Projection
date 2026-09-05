#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by ISearchManager to state proxy use.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-proxy_access
 * @namespace Windows.Win32.System.Search
 */
class PROXY_ACCESS extends Win32Enum {

    /**
     * Use proxy as set by Internet settings.
     * Native name: PROXY_ACCESS_PRECONFIG
     * @type {Integer (Int32)}
     */
    static PRECONFIG => 0

    /**
     * Do not use a proxy.
     * Native name: PROXY_ACCESS_DIRECT
     * @type {Integer (Int32)}
     */
    static DIRECT => 1

    /**
     * Use the specified proxy.
     * Native name: PROXY_ACCESS_PROXY
     * @type {Integer (Int32)}
     */
    static PROXY => 2
}
