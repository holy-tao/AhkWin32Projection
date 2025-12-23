#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SET_SERVICE_OPERATION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_REGISTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DEREGISTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_FLUSH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ADD_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DELETE_TYPE => 5
}
