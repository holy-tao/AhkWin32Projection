#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_WEB_SOCKET_BUFFER_TYPE extends Win32Enum {

    /**
     * Native name: HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE
     * @type {Integer (Int32)}
     */
    static BINARY_MESSAGE_TYPE => 0

    /**
     * Native name: HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE
     * @type {Integer (Int32)}
     */
    static BINARY_FRAGMENT_TYPE => 1

    /**
     * Native name: HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE
     * @type {Integer (Int32)}
     */
    static UTF8_MESSAGE_TYPE => 2

    /**
     * Native name: HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE
     * @type {Integer (Int32)}
     */
    static UTF8_FRAGMENT_TYPE => 3

    /**
     * Native name: HTTP_WEB_SOCKET_CLOSE_TYPE
     * @type {Integer (Int32)}
     */
    static CLOSE_TYPE => 4

    /**
     * Native name: HTTP_WEB_SOCKET_PING_TYPE
     * @type {Integer (Int32)}
     */
    static PING_TYPE => 5
}
