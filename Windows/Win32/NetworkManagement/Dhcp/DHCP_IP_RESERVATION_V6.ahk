#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * Defines an IPv6 reservation for a DHCPv6 client in a specific IPv6 prefix.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_RESERVATION_V6 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address of the DHCPv6 client for which an IPv6 reservation is created.
     */
    ReservedIpAddress : DHCP_IPV6_ADDRESS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure that contains the hardware address (MAC address) of the DHCPv6 client for which the IPv6 reservation is created.
     */
    ReservedForClient : DHCP_BINARY_DATA.Ptr

    /**
     * Integer that specifies the interface identifier for which the IPv6 reservation is created.
     */
    InterfaceId : UInt32

}
