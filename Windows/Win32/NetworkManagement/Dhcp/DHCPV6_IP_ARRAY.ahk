#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }

/**
 * The DHCPV6_IP_ARRAY structure contains an array of DHCP IPv6 address structures.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_ip_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_IP_ARRAY {
    #StructPack 8

    /**
     * The number of elements in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structures.
     */
    Elements : DHCP_IPV6_ADDRESS.Ptr

}
