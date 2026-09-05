#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WINHTTP_WEB_SOCKET_OPERATION enumeration includes the WebSocket operation type.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ne-winhttp-winhttp_web_socket_operation
 * @namespace Windows.Win32.Networking.WinHttp
 */
class WINHTTP_WEB_SOCKET_OPERATION extends Win32Enum {

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketsend">WinHttpWebSocketSend</a> operation.
     * Native name: WINHTTP_WEB_SOCKET_SEND_OPERATION
     * @type {Integer (Int32)}
     */
    static SEND_OPERATION => 0

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketreceive">WinHttpWebSocketReceive</a> operation.
     * Native name: WINHTTP_WEB_SOCKET_RECEIVE_OPERATION
     * @type {Integer (Int32)}
     */
    static RECEIVE_OPERATION => 1

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a> operation.
     * Native name: WINHTTP_WEB_SOCKET_CLOSE_OPERATION
     * @type {Integer (Int32)}
     */
    static CLOSE_OPERATION => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a> operation.
     * Native name: WINHTTP_WEB_SOCKET_SHUTDOWN_OPERATION
     * @type {Integer (Int32)}
     */
    static SHUTDOWN_OPERATION => 3
}
