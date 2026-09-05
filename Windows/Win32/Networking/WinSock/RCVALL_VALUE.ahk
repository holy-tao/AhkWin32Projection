#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class RCVALL_VALUE extends Win32Enum {

    /**
     * Native name: RCVALL_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: RCVALL_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * Native name: RCVALL_SOCKETLEVELONLY
     * @type {Integer (Int32)}
     */
    static SOCKETLEVELONLY => 2

    /**
     * Native name: RCVALL_IPLEVEL
     * @type {Integer (Int32)}
     */
    static IPLEVEL => 3
}
