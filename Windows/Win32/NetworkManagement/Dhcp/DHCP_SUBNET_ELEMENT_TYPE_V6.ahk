#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_ELEMENT_TYPE_V6 extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Dhcpv6IpRanges => 0

    /**
     * @type {Integer (Int32)}
     */
    static Dhcpv6ReservedIps => 1

    /**
     * @type {Integer (Int32)}
     */
    static Dhcpv6ExcludedIpRanges => 2
}
