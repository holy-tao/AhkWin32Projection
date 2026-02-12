#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains status information on the progress of an [HttpClient](httpclient.md) operation.
 * @remarks
 * When sending (POST method) an [HttpBufferContent](httpbuffercontent.md) class, the  value jumps from 0% bytes sent to 100% bytes sent in one progress event, because the whole buffer is moved to lower network APIs all at once. For more detailed progress, use [HttpStreamContent](httpstreamcontent.md) instead of [HttpBufferContent](httpbuffercontent.md), because streams are read and sent in smaller chunks, resulting in more progress events. E.g. 0 bytes sent, 65536 bytes sent, 131072 bytes sent, etc.
 * @see https://learn.microsoft.com/uwp/api/windows.web.http.httpprogress
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class HttpProgress extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The step in the progress of an HTTP connection.
     * @type {Integer}
     */
    Stage {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The total number of bytes sent.
     * 
     * This value includes bytes sent as request headers.
     * 
     * If the operation was restarted, this value may be smaller than in the previous progress report.
     * @type {Integer}
     */
    BytesSent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of data bytes to send.
     * 
     * If the number is unknown, this value is 0.
     * @type {IReference<Integer>}
     */
    TotalBytesToSend {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The total number of bytes received.
     * 
     * This value includes bytes received as response headers.
     * 
     * If the operation was restarted, this value may be smaller than in the previous progress report.
     * @type {Integer}
     */
    BytesReceived {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The total number of data bytes to receive.
     * 
     * If the number is unknown, this value is 0.
     * @type {IReference<Integer>}
     */
    TotalBytesToReceive {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The number of retries.
     * @type {Integer}
     */
    Retries {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
