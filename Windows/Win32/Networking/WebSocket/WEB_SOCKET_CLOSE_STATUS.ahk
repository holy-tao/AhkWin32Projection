#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the WebSocket close status.
 * @see https://docs.microsoft.com/windows/win32/api//websocket/ne-websocket-web_socket_close_status
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_CLOSE_STATUS{

    /**
     * Close completed successfully.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_SUCCESS_CLOSE_STATUS => 1000

    /**
     * The endpoint is going away and thus closing the connection.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_ENDPOINT_UNAVAILABLE_CLOSE_STATUS => 1001

    /**
     * Peer detected protocol error and it is closing the connection.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS => 1002

    /**
     * The endpoint cannot receive this type of data.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS => 1003

    /**
     * No close status
 *       code was provided.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_EMPTY_CLOSE_STATUS => 1005

    /**
     * The
 *       connection was closed without sending or
 *       receiving a close frame.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_ABORTED_CLOSE_STATUS => 1006

    /**
     * Data within a message is not consistent with the type of the message.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS => 1007

    /**
     * The message violates an endpoint's policy.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS => 1008

    /**
     * The message sent was too large to process.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS => 1009

    /**
     * A client endpoint expected the server to negotiate one or more extensions, but the server didn't return them in the response message of the WebSocket handshake.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS => 1010

    /**
     * An unexpected condition prevented the server from
 *       fulfilling the request.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS => 1011

    /**
     * The
 *       TLS handshake could not be completed.
     * @type {Integer (Int32)}
     */
    static WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS => 1015
}
