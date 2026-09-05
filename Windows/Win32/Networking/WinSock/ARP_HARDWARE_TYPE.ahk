#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class ARP_HARDWARE_TYPE extends Win32Enum {

    /**
     * Native name: ARP_HW_ENET
     * @type {Integer (Int32)}
     */
    static HW_ENET => 1

    /**
     * Native name: ARP_HW_802
     * @type {Integer (Int32)}
     */
    static HW_802 => 6
}
