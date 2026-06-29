#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINHTTP_WEB_SOCKET_OPERATION.ahk" { WINHTTP_WEB_SOCKET_OPERATION }
#Import ".\WINHTTP_ASYNC_RESULT.ahk" { WINHTTP_ASYNC_RESULT }

/**
 * The WINHTTP_WEB_SOCKET_ASYNC_RESULT includes the result status of a WebSocket operation.
 * @remarks
 * A <b>WINHTTP_WEB_SOCKET_ASYNC_RESULT</b> structure is passed to the completion callbacks of WebSocket functions such as <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketsend">WinHttpWebSocketSend</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> when <i>dwInternetStatus</i> is <b>WINHTTP_CALLBACK_STATUS_REQUEST_ERROR</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_web_socket_async_result
 * @namespace Windows.Win32.Networking.WinHttp
 */
export default struct WINHTTP_WEB_SOCKET_ASYNC_RESULT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_async_result">WINHTTP_ASYNC_RESULT</a></b>
     * 
     * The result of a WebSocket operation.
     */
    AsyncResult : WINHTTP_ASYNC_RESULT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winhttp/ne-winhttp-winhttp_web_socket_operation">WINHTTP_WEB_SOCKET_OPERATION</a></b>
     * 
     * The type of WebSocket operation.
     */
    Operation : WINHTTP_WEB_SOCKET_OPERATION

}
