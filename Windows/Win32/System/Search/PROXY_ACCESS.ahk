#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by ISearchManager to state proxy use.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-proxy_access
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class PROXY_ACCESS{

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
