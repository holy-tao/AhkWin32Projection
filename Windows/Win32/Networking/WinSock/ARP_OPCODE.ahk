#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ARP_OPCODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ARP_REQUEST => 1

    /**
     * @type {Integer (Int32)}
     */
    static ARP_RESPONSE => 2
}
