#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }

/**
 * Specifies a range of IPv6 addresses for use with a DHCPv6 server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_RANGE_V6 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the first IPv6 address in the range.
     */
    StartAddress : DHCP_IPV6_ADDRESS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the last IPv6 address in the range.
     */
    EndAddress : DHCP_IPV6_ADDRESS

}
