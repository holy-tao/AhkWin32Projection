#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_WEB_SOCKET_OPERATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_SEND_OPERATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_RECEIVE_OPERATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_CLOSE_OPERATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_SHUTDOWN_OPERATION => 3
}
