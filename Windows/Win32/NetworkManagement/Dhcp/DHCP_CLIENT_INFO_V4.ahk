#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DATE_TIME.ahk" { DATE_TIME }
#Import ".\DHCP_HOST_INFO.ahk" { DHCP_HOST_INFO }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * Defines a client information record used by the DHCP server, extending the definition provided in DHCP_CLIENT_INFO by including client type information.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v4
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_V4 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the assigned IP address of the DHCP client.
     */
    ClientIpAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_MASK</a> value that contains the subnet mask value assigned to the DHCP client.
     */
    SubnetMask : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure containing the MAC address of the client's network interface device.
     */
    ClientHardwareAddress : DHCP_BINARY_DATA

    /**
     * Unicode string that specifies the network name of the DHCP client. This member is optional.
     */
    ClientName : PWSTR

    /**
     * Unicode string that contains a comment associated with the DHCP client. This member is optional.
     */
    ClientComment : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the date and time the DHCP client lease will expire, in UTC time.
     */
    ClientLeaseExpires : DATE_TIME

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info">DHCP_HOST_INFO</a> structure that contains information on the DHCP server that assigned the IP address to the  client.
     */
    OwnerHost : DHCP_HOST_INFO

    /**
     * Specifies the types of dynamic IP address service used by the client.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_UNSPECIFIED"></a><a id="client_type_unspecified"></a><dl>
     * <dt><b>CLIENT_TYPE_UNSPECIFIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client's dynamic IP address protocol is unknown.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_DHCP"></a><a id="client_type_dhcp"></a><dl>
     * <dt><b>CLIENT_TYPE_DHCP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client uses DHCP for dynamic IP address service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_BOOTP"></a><a id="client_type_bootp"></a><dl>
     * <dt><b>CLIENT_TYPE_BOOTP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client uses BOOTP for dynamic IP address service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_BOTH"></a><a id="client_type_both"></a><dl>
     * <dt><b>CLIENT_TYPE_BOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client can use either DHCP or BOOTP for dynamic IP address service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_NONE"></a><a id="client_type_none"></a><dl>
     * <dt><b>CLIENT_TYPE_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client does not use a supported dynamic IP address service.
     * 
     * </td>
     * </tr>
     * </table>
     */
    bClientType : Int8

}
