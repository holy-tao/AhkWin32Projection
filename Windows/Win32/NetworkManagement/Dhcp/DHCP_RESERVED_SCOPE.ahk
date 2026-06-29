#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_RESERVED_SCOPE structure defines a reserved DHCP scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_reserved_scope
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_RESERVED_SCOPE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains an IP address used to identify the reservation.
     */
    ReservedIpAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet ID of the subnet containing the reservation.
     */
    ReservedIpSubnetAddress : UInt32

}
