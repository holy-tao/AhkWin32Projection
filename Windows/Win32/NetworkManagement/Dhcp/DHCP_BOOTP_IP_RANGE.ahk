#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_BOOTP_IP_RANGE structure defines a suite of IPs for lease to BOOTP-specific clients.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_bootp_ip_range
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_BOOTP_IP_RANGE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the start of the IP range used for BOOTP service.
     */
    StartAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the end of the IP range used for BOOTP service.
     */
    EndAddress : UInt32

    /**
     * Specifies the number of BOOTP clients with addresses served from this range.
     */
    BootpAllocated : UInt32

    /**
     * Specifies the maximum number of BOOTP clients this range is allowed to serve.
     */
    MaxBootpAllowed : UInt32

}
