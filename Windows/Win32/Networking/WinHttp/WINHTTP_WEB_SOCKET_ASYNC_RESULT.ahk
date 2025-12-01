#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINHTTP_ASYNC_RESULT.ahk

/**
 * The WINHTTP_WEB_SOCKET_ASYNC_RESULT includes the result status of a WebSocket operation.
 * @remarks
 * A <b>WINHTTP_WEB_SOCKET_ASYNC_RESULT</b> structure is passed to the completion callbacks of WebSocket functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketsend">WinHttpWebSocketSend</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> when <i>dwInternetStatus</i> is <b>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_web_socket_async_result
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_WEB_SOCKET_ASYNC_RESULT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_async_result">WINHTTP_ASYNC_RESULT</a></b>
     * 
     * The result of a WebSocket operation.
     * @type {WINHTTP_ASYNC_RESULT}
     */
    AsyncResult{
        get {
            if(!this.HasProp("__AsyncResult"))
                this.__AsyncResult := WINHTTP_ASYNC_RESULT(0, this)
            return this.__AsyncResult
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_operation">WINHTTP_WEB_SOCKET_OPERATION</a></b>
     * 
     * The type of WebSocket operation.
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
