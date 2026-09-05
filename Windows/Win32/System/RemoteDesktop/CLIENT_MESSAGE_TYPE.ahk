#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class CLIENT_MESSAGE_TYPE extends Win32Enum {

    /**
     * Native name: CLIENT_MESSAGE_CONNECTION_INVALID
     * @type {Integer (Int32)}
     */
    static CONNECTION_INVALID => 0

    /**
     * Native name: CLIENT_MESSAGE_CONNECTION_STATUS
     * @type {Integer (Int32)}
     */
    static CONNECTION_STATUS => 1

    /**
     * Native name: CLIENT_MESSAGE_CONNECTION_ERROR
     * @type {Integer (Int32)}
     */
    static CONNECTION_ERROR => 2
}
