#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class CLIENT_MESSAGE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLIENT_MESSAGE_CONNECTION_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLIENT_MESSAGE_CONNECTION_STATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLIENT_MESSAGE_CONNECTION_ERROR => 2
}
