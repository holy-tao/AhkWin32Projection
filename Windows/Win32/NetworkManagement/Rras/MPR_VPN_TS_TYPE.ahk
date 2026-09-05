#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
class MPR_VPN_TS_TYPE extends Win32Enum {

    /**
     * Native name: MPR_VPN_TS_IPv4_ADDR_RANGE
     * @type {Integer (Int32)}
     */
    static IPv4_ADDR_RANGE => 7

    /**
     * Native name: MPR_VPN_TS_IPv6_ADDR_RANGE
     * @type {Integer (Int32)}
     */
    static IPv6_ADDR_RANGE => 8
}
