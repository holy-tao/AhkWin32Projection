#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }

/**
 * The DHCPV6_STATELESS_SCOPE_STATS structure defines the address counters for a specific IPv6 stateless subnet. The number of stateless IPv6 clients added and removed from the stateless client inventory are stored in this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_scope_stats
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_STATELESS_SCOPE_STATS {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that specifies the IPv6 prefix of the DHCPv6 stateless scope.
     */
    SubnetAddress : DHCP_IPV6_ADDRESS

    /**
     * Integer that specifies the number of IPv6 stateless clients that have been added to the DHCPv6 stateless client inventory for the prefix in <b>SubnetAddress</b>.
     */
    NumStatelessClientsAdded : Int64

    /**
     * Integer that specifies the number of IPv6 stateless clients that have been removed from the DHCPv6 stateless client inventory for the prefix in <b>SubnetAddress</b>.
     */
    NumStatelessClientsRemoved : Int64

}
