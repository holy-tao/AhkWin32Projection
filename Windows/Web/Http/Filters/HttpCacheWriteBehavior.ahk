#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates if content returned by requests used by class methods in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) and [Windows.Web.Http.Filters](windows_web_http_filters.md) namespaces is written to the local HTTP cache.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpcachewritebehavior
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class HttpCacheWriteBehavior extends Win32Enum{

    /**
     * Use the default behavior of WinInet. This usually results in writing the response to the local HTTP cache.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Never write the response to the local HTTP cache.
     * @type {Integer (Int32)}
     */
    static NoCache => 1
}
