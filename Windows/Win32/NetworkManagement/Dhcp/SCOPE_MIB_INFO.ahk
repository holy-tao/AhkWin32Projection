#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines information about an available scope for use within returned DHCP-specific SNMP Management Information Block (MIB) data.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-scope_mib_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct SCOPE_MIB_INFO {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet mask for this scope.
     */
    Subnet : UInt32

    /**
     * Contains the number of IP addresses currently in use for this scope.
     */
    NumAddressesInuse : UInt32

    /**
     * Contains the number of IP addresses currently available for this scope.
     */
    NumAddressesFree : UInt32

    /**
     * Contains the number of IP addresses currently in the offer state for this scope.
     */
    NumPendingOffers : UInt32

}
