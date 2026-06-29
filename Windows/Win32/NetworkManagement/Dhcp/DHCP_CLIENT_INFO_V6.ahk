#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_HOST_INFO_V6.ahk" { DHCP_HOST_INFO_V6 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }
#Import ".\DATE_TIME.ahk" { DATE_TIME }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * The DHCP_CLIENT_INFO_V6 structure contains information on DHCPv6 clients.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_V6 {
    #StructPack 8

    /**
     * This is of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> (section 2.2.1.2.28), containing the DHCPv6 client's IPv6 address.
     */
    ClientIpAddress : DHCP_IPV6_ADDRESS

    /**
     * This is of type DHCP_CLIENT_UID (section 2.2.1.2.5), containing the DHCPv6 client identifier.
     */
    ClientDUID : DHCP_BINARY_DATA

    /**
     * This is of type <b>DWORD</b>, specifying the type of IPv6 address.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_TYPE_IANA"></a><a id="address_type_iana"></a><dl>
     * <dt><b>ADDRESS_TYPE_IANA</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an IANA address. [RFC3315]
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_TYPE_IATA"></a><a id="address_type_iata"></a><dl>
     * <dt><b>ADDRESS_TYPE_IATA</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an IATA address. [RFC3315]
     * 
     * </td>
     * </tr>
     * </table>
     */
    AddressType : UInt32

    /**
     * This is of type <b>DWORD</b>, specifying the interface identifier of the DHCPv6 client interface.
     */
    IAID : UInt32

    /**
     * A pointer to a null-terminated Unicode string containing the name of the DHCPv6 client.
     */
    ClientName : PWSTR

    /**
     * A pointer to a null-terminated Unicode string containing a comment relating to the DHCPv6 client.
     */
    ClientComment : PWSTR

    /**
     * This is of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> (section 2.2.1.2.11), containing the valid lifetime of the DHCPv6 IPv6 client lease.
     */
    ClientValidLeaseExpires : DATE_TIME

    /**
     * This is of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a>, containing the preferred lifetime of the DHCPv6 client lease.
     */
    ClientPrefLeaseExpires : DATE_TIME

    /**
     * This of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info_v6">DHCP_HOST_INFO_V6</a> (section 2.2.1.2.63), containing information about the host machine (DHCPv6 server machine) that has given this IPv6 lease to this DHCPv6 client.
     */
    OwnerHost : DHCP_HOST_INFO_V6

}
