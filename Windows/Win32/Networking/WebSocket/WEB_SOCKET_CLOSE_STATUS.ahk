#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the WebSocket close status.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ne-websocket-web_socket_close_status
 * @namespace Windows.Win32.Networking.WebSocket
 */
class WEB_SOCKET_CLOSE_STATUS extends Win32Enum {

    /**
     * Close completed successfully.
     * Native name: WEB_SOCKET_SUCCESS_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static SUCCESS_CLOSE_STATUS => 1000

    /**
     * The endpoint is going away and thus closing the connection.
     * Native name: WEB_SOCKET_ENDPOINT_UNAVAILABLE_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static ENDPOINT_UNAVAILABLE_CLOSE_STATUS => 1001

    /**
     * Peer detected protocol error and it is closing the connection.
     * Native name: WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static PROTOCOL_ERROR_CLOSE_STATUS => 1002

    /**
     * The endpoint cannot receive this type of data.
     * Native name: WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static INVALID_DATA_TYPE_CLOSE_STATUS => 1003

    /**
     * No close status
     *       code was provided.
     * Native name: WEB_SOCKET_EMPTY_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static EMPTY_CLOSE_STATUS => 1005

    /**
     * The
     *       connection was closed without sending or
     *       receiving a close frame.
     * Native name: WEB_SOCKET_ABORTED_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static ABORTED_CLOSE_STATUS => 1006

    /**
     * Data within a message is not consistent with the type of the message.
     * Native name: WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static INVALID_PAYLOAD_CLOSE_STATUS => 1007

    /**
     * The message violates an endpoint's policy.
     * Native name: WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static POLICY_VIOLATION_CLOSE_STATUS => 1008

    /**
     * The message sent was too large to process.
     * Native name: WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static MESSAGE_TOO_BIG_CLOSE_STATUS => 1009

    /**
     * A client endpoint expected the server to negotiate one or more extensions, but the server didn't return them in the response message of the WebSocket handshake.
     * Native name: WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED_EXTENSIONS_CLOSE_STATUS => 1010

    /**
     * An unexpected condition prevented the server from
     *       fulfilling the request.
     * Native name: WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static SERVER_ERROR_CLOSE_STATUS => 1011

    /**
     * The
     *       TLS handshake could not be completed.
     * Native name: WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static SECURE_HANDSHAKE_ERROR_CLOSE_STATUS => 1015
}
