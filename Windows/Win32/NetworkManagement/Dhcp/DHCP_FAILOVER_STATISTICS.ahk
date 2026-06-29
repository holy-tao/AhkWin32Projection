#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_FAILOVER_STATISTICS structure defines DHCP server scope statistics that are part of a failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_statistics
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FAILOVER_STATISTICS {
    #StructPack 4

    /**
     * Value that specifies the total number of addresses in a DHCPv4 scope that are part of a failover relationship.
     */
    NumAddr : UInt32

    /**
     * Value that specifies the total number of free IPv4 addresses that can be leased out to clients in a DHCPv4 scope that are part of a failover relationship.
     */
    AddrFree : UInt32

    /**
     * Value that specifies the total number of IPv4 addresses that are leased out to clients in a DHCPv4 scope that are part of a failover relationship.
     */
    AddrInUse : UInt32

    /**
     * Value that specifies the number of free IPv4 addresses on the partner server that can be leased out to clients in a DHCPv4 scope that are part of a failover relationship.
     */
    PartnerAddrFree : UInt32

    /**
     * Value that specifies the number of free IPv4 addresses on the local server that can be leased out to clients in a DHCPv4 scope that are part of a failover relationship.
     */
    ThisAddrFree : UInt32

    /**
     * Value that specifies the number of IPv4 addresses on the partner server that are leased out to clients in a DHCPv4 scope that are part of a failover relationship.
     */
    PartnerAddrInUse : UInt32

    /**
     * Value that specifies the number of IPv4 addresses on the local server that are leased out to clients in a DHCPv4 scope that are part of a failover relationship.
     */
    ThisAddrInUse : UInt32

}
