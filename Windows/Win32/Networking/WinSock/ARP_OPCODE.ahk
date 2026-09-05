#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ARP_OPCODE extends Win32Enum {

    /**
     * Native name: ARP_REQUEST
     * @type {Integer (Int32)}
     */
    static REQUEST => 1

    /**
     * Native name: ARP_RESPONSE
     * @type {Integer (Int32)}
     */
    static RESPONSE => 2
}
