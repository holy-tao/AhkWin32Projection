#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the cookie usage behavior that is used in the [CookieUsageBehavior](httpbaseprotocolfilter_cookieusagebehavior.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.filters.httpcookieusagebehavior
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class HttpCookieUsageBehavior extends Win32Enum{

    /**
     * Automatically handle cookies.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Do not handle cookies automatically.
     * @type {Integer (Int32)}
     */
    static NoCookies => 1
}
