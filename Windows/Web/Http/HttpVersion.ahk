#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the HTTP protocol version.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpversion
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpVersion extends Win32Enum{

    /**
     * This value may be returned by third party filters.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * HTTP 1.0.
     * @type {Integer (Int32)}
     */
    static Http10 => 1

    /**
     * HTTP 1.1.
     * @type {Integer (Int32)}
     */
    static Http11 => 2

    /**
     * HTTP 2.0
     * @type {Integer (Int32)}
     */
    static Http20 => 3
}
