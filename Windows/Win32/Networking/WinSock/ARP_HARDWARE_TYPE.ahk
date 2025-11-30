#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class ARP_HARDWARE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ARP_HW_ENET => 1

    /**
     * @type {Integer (Int32)}
     */
    static ARP_HW_802 => 6
}
