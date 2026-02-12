#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates if read requests by class methods in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) and [Windows.Web.Http.Filters](windows_web_http_filters.md) namespaces use the local HTTP cache for the response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpcachereadbehavior
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class HttpCacheReadBehavior extends Win32Enum{

    /**
     * Always use the cache algorithm specified in [RFC 2616](https://tools.ietf.org/html/rfc2616) by the IETF to optimize network bandwidth.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Use the local HTTP cache if possible but always ask the server if more recent content is available.
     * 
     * The server returns an HTTP status code of 200 (OK) or 304 (Not Modified) when the local content is the most recent.
     * @type {Integer (Int32)}
     */
    static MostRecent => 1

    /**
     * Only use data from the local HTTP cache. This is the offline behavior.
     * @type {Integer (Int32)}
     */
    static OnlyFromCache => 2

    /**
     * Do not use cache nor do a conditional request. This ensures that all HTTP requests go directly to the server.
     * @type {Integer (Int32)}
     */
    static NoCache => 3
}
