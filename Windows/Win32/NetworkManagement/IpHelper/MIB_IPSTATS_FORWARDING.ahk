#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_IPSTATS_FORWARDING extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IP_FORWARDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static MIB_IP_NOT_FORWARDING => 2
}
