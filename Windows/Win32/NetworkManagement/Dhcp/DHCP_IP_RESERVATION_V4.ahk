#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * The DHCP_IP_RESERVATION_V4 structure defines a client IP reservation. This structure extends an IP reservation by including the type of client (DHCP or BOOTP) holding the reservation.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation_v4
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IP_RESERVATION_V4 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the reserved IP address.
     */
    ReservedIpAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure that contains the hardware address (MAC address) of the DHCPv4 client that holds this reservation.
     */
    ReservedForClient : DHCP_BINARY_DATA.Ptr

    /**
     * Value that specifies the DHCPv4 reserved client type. The possible values are below:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_DHCP"></a><a id="client_type_dhcp"></a><dl>
     * <dt><b>CLIENT_TYPE_DHCP</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client supports the DHCP protocol only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_BOOTP"></a><a id="client_type_bootp"></a><dl>
     * <dt><b>CLIENT_TYPE_BOOTP</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client supports the BOOTP protocol only.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_BOTH"></a><a id="client_type_both"></a><dl>
     * <dt><b>CLIENT_TYPE_BOTH</b></dt>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client supports both the DHCPv4 and the BOOTP protocols.
     * 
     * </td>
     * </tr>
     * </table>
     */
    bAllowedClientTypes : Int8

}
