#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_WEB_SOCKET_CLOSE_STATUS extends Win32Enum {

    /**
     * Native name: HTTP_WEB_SOCKET_SUCCESS_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static SUCCESS_CLOSE_STATUS => 1000

    /**
     * Native name: HTTP_WEB_SOCKET_ENDPOINT_TERMINATED_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static ENDPOINT_TERMINATED_CLOSE_STATUS => 1001

    /**
     * Native name: HTTP_WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static PROTOCOL_ERROR_CLOSE_STATUS => 1002

    /**
     * Native name: HTTP_WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static INVALID_DATA_TYPE_CLOSE_STATUS => 1003

    /**
     * Native name: HTTP_WEB_SOCKET_EMPTY_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static EMPTY_CLOSE_STATUS => 1005

    /**
     * Native name: HTTP_WEB_SOCKET_ABORTED_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static ABORTED_CLOSE_STATUS => 1006

    /**
     * Native name: HTTP_WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static INVALID_PAYLOAD_CLOSE_STATUS => 1007

    /**
     * Native name: HTTP_WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static POLICY_VIOLATION_CLOSE_STATUS => 1008

    /**
     * Native name: HTTP_WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static MESSAGE_TOO_BIG_CLOSE_STATUS => 1009

    /**
     * Native name: HTTP_WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static UNSUPPORTED_EXTENSIONS_CLOSE_STATUS => 1010

    /**
     * Native name: HTTP_WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static SERVER_ERROR_CLOSE_STATUS => 1011

    /**
     * Native name: HTTP_WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS
     * @type {Integer (Int32)}
     */
    static SECURE_HANDSHAKE_ERROR_CLOSE_STATUS => 1015
}
