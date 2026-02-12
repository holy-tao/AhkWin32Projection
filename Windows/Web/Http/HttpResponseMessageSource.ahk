#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the source of the data received in the [HttpResponseMessage](httpresponsemessage.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpresponsemessagesource
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpResponseMessageSource extends Win32Enum{

    /**
     * A default value that should not be returned under normal circumstances.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The data was from the local cache.
     * @type {Integer (Int32)}
     */
    static Cache => 1

    /**
     * The data was received over the network.
     * @type {Integer (Int32)}
     */
    static Network => 2
}
