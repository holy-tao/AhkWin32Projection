#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_IP_RANGE structure defines a range of IP addresses.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_range
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_RANGE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the first IP address in the range.
     */
    StartAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the last IP address in the range.
     */
    EndAddress : UInt32

}
