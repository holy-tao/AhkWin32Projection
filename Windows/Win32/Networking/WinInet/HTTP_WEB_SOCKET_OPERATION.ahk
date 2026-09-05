#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class HTTP_WEB_SOCKET_OPERATION extends Win32Enum {

    /**
     * Native name: HTTP_WEB_SOCKET_SEND_OPERATION
     * @type {Integer (Int32)}
     */
    static SEND_OPERATION => 0

    /**
     * Native name: HTTP_WEB_SOCKET_RECEIVE_OPERATION
     * @type {Integer (Int32)}
     */
    static RECEIVE_OPERATION => 1

    /**
     * Native name: HTTP_WEB_SOCKET_CLOSE_OPERATION
     * @type {Integer (Int32)}
     */
    static CLOSE_OPERATION => 2

    /**
     * Native name: HTTP_WEB_SOCKET_SHUTDOWN_OPERATION
     * @type {Integer (Int32)}
     */
    static SHUTDOWN_OPERATION => 3
}
