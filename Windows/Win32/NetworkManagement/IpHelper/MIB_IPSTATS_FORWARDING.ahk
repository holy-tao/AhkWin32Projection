#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_IPSTATS_FORWARDING extends Win32Enum {

    /**
     * Native name: MIB_IP_FORWARDING
     * @type {Integer (Int32)}
     */
    static IP_FORWARDING => 1

    /**
     * Native name: MIB_IP_NOT_FORWARDING
     * @type {Integer (Int32)}
     */
    static IP_NOT_FORWARDING => 2
}
