#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WINSOCK_SHUTDOWN_HOW extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SD_RECEIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SD_SEND => 1

    /**
     * @type {Integer (Int32)}
     */
    static SD_BOTH => 2
}
