#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether asynchronous [HttpClient](httpclient.md) operations are considered completed when all of the response is read, or when just the headers are read.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpcompletionoption
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpCompletionOption extends Win32Enum{

    /**
     * The operation should complete after reading the entire response including the content.
     * 
     * This is the default value.
     * @type {Integer (Int32)}
     */
    static ResponseContentRead => 0

    /**
     * The operation should complete as soon as a response is available and headers are read. The content is not read yet.
     * @type {Integer (Int32)}
     */
    static ResponseHeadersRead => 1
}
