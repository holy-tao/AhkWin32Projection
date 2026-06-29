#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about a specific DHCP scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-scope_mib_info_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct SCOPE_MIB_INFO_V5 {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the subnet gateway that defines the scope.
     */
    Subnet : UInt32

    /**
     * The number of IP addresses in the scope that are currently assigned to DHCP clients.
     */
    NumAddressesInuse : UInt32

    /**
     * The number of IP addresses in the scope that are not currently  assigned to DHCP clients.
     */
    NumAddressesFree : UInt32

    /**
     * The number of IP addresses in the scope that have been offered to DHCP clients but have not yet received REQUEST messages.
     */
    NumPendingOffers : UInt32

}
