#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_WEB_SOCKET_CLOSE_STATUS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_SUCCESS_CLOSE_STATUS => 1000

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_ENDPOINT_TERMINATED_CLOSE_STATUS => 1001

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_PROTOCOL_ERROR_CLOSE_STATUS => 1002

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_INVALID_DATA_TYPE_CLOSE_STATUS => 1003

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_EMPTY_CLOSE_STATUS => 1005

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_ABORTED_CLOSE_STATUS => 1006

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_INVALID_PAYLOAD_CLOSE_STATUS => 1007

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_POLICY_VIOLATION_CLOSE_STATUS => 1008

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_MESSAGE_TOO_BIG_CLOSE_STATUS => 1009

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_UNSUPPORTED_EXTENSIONS_CLOSE_STATUS => 1010

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_SERVER_ERROR_CLOSE_STATUS => 1011

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_SECURE_HANDSHAKE_ERROR_CLOSE_STATUS => 1015
}
