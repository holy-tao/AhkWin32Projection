#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WINHTTP_WEB_SOCKET_CLOSE_STATUS enumeration includes the status of a WebSocket close operation.
 * @remarks
 * 
 * <b>WINHTTP_WEB_SOCKET_CLOSE_STATUS</b> is used by <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketclose">WinHttpWebSocketClose</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketshutdown">WinHttpWebSocketShutdown</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winhttp/nf-winhttp-winhttpwebsocketqueryclosestatus">WinHttpWebSocketQueryCloseStatus</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winhttp/ne-winhttp-winhttp_web_socket_close_status
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_WEB_SOCKET_CLOSE_STATUS{

    /**
     * The connection closed successfully.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_SUCCESS_CLOSE_STATUS => 1000

    /**
     * The peer is going away and terminating the connection.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_ENDPOINT_TERMINATED_CLOSE_STATUS => 1001

    /**
     * A protocol error occurred.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS => 1002

    /**
     * Invalid data received by the peer.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS => 1003

    /**
     * The close message was empty.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_EMPTY_CLOSE_STATUS => 1005

    /**
     * The connection was aborted.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_ABORTED_CLOSE_STATUS => 1006

    /**
     * The payload was invalid.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS => 1007

    /**
     * The message violates an endpoint's policy.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS => 1008

    /**
     * The message sent was too large to process.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS => 1009

    /**
     * A client endpoint expected the server to negotiate one or more extensions, but the server didn't return them in the response message of the WebSocket handshake.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS => 1010

    /**
     * An unexpected condition prevented the server from
     *       fulfilling the request.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS => 1011

    /**
     * The TLS handshake could not be completed.
     * @type {Integer (Int32)}
     */
    static WINHTTP_WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS => 1015
}
