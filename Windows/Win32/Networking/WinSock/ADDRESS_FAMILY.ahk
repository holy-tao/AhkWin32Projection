#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ADDRESS_FAMILY extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static AF_INET => 2

    /**
     * @type {Integer (UInt16)}
     */
    static AF_INET6 => 23

    /**
     * @type {Integer (UInt16)}
     */
    static AF_UNSPEC => 0
}
