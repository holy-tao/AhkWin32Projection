#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class SET_SERVICE_OPERATION extends Win32Enum {

    /**
     * Native name: SERVICE_REGISTER
     * @type {Integer (UInt32)}
     */
    static REGISTER => 1

    /**
     * Native name: SERVICE_DEREGISTER
     * @type {Integer (UInt32)}
     */
    static DEREGISTER => 2

    /**
     * Native name: SERVICE_FLUSH
     * @type {Integer (UInt32)}
     */
    static FLUSH => 3

    /**
     * Native name: SERVICE_ADD_TYPE
     * @type {Integer (UInt32)}
     */
    static ADD_TYPE => 4

    /**
     * Native name: SERVICE_DELETE_TYPE
     * @type {Integer (UInt32)}
     */
    static DELETE_TYPE => 5
}
