#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_VPN_TS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MPR_VPN_TS_IPv4_ADDR_RANGE => 7

    /**
     * @type {Integer (Int32)}
     */
    static MPR_VPN_TS_IPv6_ADDR_RANGE => 8
}
