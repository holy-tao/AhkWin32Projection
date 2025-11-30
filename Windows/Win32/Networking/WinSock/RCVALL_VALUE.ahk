#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RCVALL_VALUE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RCVALL_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static RCVALL_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static RCVALL_SOCKETLEVELONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static RCVALL_IPLEVEL => 3
}
