#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class HTTP_WEB_SOCKET_BUFFER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_BINARY_MESSAGE_TYPE => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_BINARY_FRAGMENT_TYPE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_UTF8_MESSAGE_TYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_UTF8_FRAGMENT_TYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_CLOSE_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_WEB_SOCKET_PING_TYPE => 5
}
