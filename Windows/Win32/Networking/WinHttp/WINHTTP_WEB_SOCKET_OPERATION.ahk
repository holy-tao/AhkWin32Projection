#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WINHTTP_WEB_SOCKET_OPERATION enumeration includes the WebSocket operation type.
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ne-winhttp-winhttp_web_socket_operation
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_WEB_SOCKET_OPERATION extends Win32Enum{

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketsend">WinHttpWebSocketSend</a> operation.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_SEND_OPERATION => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a> operation.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_RECEIVE_OPERATION => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> operation.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_CLOSE_OPERATION => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a> operation.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_SHUTDOWN_OPERATION => 3
}
