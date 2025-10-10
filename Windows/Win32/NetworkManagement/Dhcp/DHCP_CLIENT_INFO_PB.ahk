#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk
#Include .\DATE_TIME.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * The DHCP_CLIENT_INFO_PB structure defines information about a DHCPv4 client, including filter status information and any policies that resulted in the IPv4 address assignment.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLIENT_INFO_PB extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the DHCPv4 client IPv4 address.
     * @type {Integer}
     */
    ClientIpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP IP_MASK</a> structure that contains the DHCPv4 client IPv4 subnet mask.
     * @type {Integer}
     */
    SubnetMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure that contains the hardware address (MAC address) of the DHCPv4 client.
     * @type {DHCP_BINARY_DATA}
     */
    ClientHardwareAddress{
        get {
            if(!this.HasProp("__ClientHardwareAddress"))
                this.__ClientHardwareAddress := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__ClientHardwareAddress
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCPv4 client machine name.
     * @type {Pointer<Char>}
     */
    ClientName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the description of the DHCPv4 client.
     * @type {Pointer<Char>}
     */
    ClientComment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the lease expiry time for the DHCPv4 client. This is UTC time represented in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     * @type {DATE_TIME}
     */
    ClientLeaseExpires{
        get {
            if(!this.HasProp("__ClientLeaseExpires"))
                this.__ClientLeaseExpires := DATE_TIME(this.ptr + 40)
            return this.__ClientLeaseExpires
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info">DHCP_HOST_INFO</a> structure that contains information about the host machine (DHCPv4 server machine) that provided a lease to the DHCPv4 client.
     * @type {DHCP_HOST_INFO}
     */
    OwnerHost{
        get {
            if(!this.HasProp("__OwnerHost"))
                this.__OwnerHost := DHCP_HOST_INFO(this.ptr + 48)
            return this.__OwnerHost
        }
    }

    /**
     * Value that specifies the DHCPv4 client type. The possible values are below:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_UNSPECIFIED"></a><a id="client_type_unspecified"></a><dl>
     * <dt><b>CLIENT_TYPE_UNSPECIFIED</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client is not defined in the  server database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_DHCP"></a><a id="client_type_dhcp"></a><dl>
     * <dt><b>CLIENT_TYPE_DHCP</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client supports the DHCP protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_BOOTP"></a><a id="client_type_bootp"></a><dl>
     * <dt><b>CLIENT_TYPE_BOOTP</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client supports the BOOTP protocol.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_BOTH"></a><a id="client_type_both"></a><dl>
     * <dt><b>CLIENT_TYPE_BOTH</b></dt>
     * <dt>0x03</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client supports both the DHCPv4 and the BOOTP protocols
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_RESERVATION_FLAG"></a><a id="client_type_reservation_flag"></a><dl>
     * <dt><b>CLIENT_TYPE_RESERVATION_FLAG</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is an IPv4 reservation created for the DHCPv4 client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CLIENT_TYPE_NONE"></a><a id="client_type_none"></a><dl>
     * <dt><b>CLIENT_TYPE_NONE</b></dt>
     * <dt>0x64</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Backward compatibility for manual addressing.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    bClientType {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * Value that specifies various states of the IPv4 address. The possible values are below:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_STATE_OFFERED"></a><a id="address_state_offered"></a><dl>
     * <dt><b>ADDRESS_STATE_OFFERED</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client is offered this IPv4 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_STATE_ACTIVE"></a><a id="address_state_active"></a><dl>
     * <dt><b>ADDRESS_STATE_ACTIVE</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPv4 address is active and has an active DHCPv4 client lease record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_STATE_DECLINED"></a><a id="address_state_declined"></a><dl>
     * <dt><b>ADDRESS_STATE_DECLINED</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPv4 address request is declined by the DHCPv4 client; hence, it is a bad IPv4 address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_STATE_DOOM"></a><a id="address_state_doom"></a><dl>
     * <dt><b>ADDRESS_STATE_DOOM</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IPv4 address is in <i>DOOMED</i> state and is due to be deleted.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    AddressState {
        get => NumGet(this, 73, "char")
        set => NumPut("char", value, this, 73)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-quarantinestatus">QuarantineStatus</a> enumeration that specifies possible health status values for the DHCPv4 client, as validated at the NAP server.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the probation end time if the DHCPv4 client is on probation. The DHCPv4 client has full access to the network for this time period. This is UTC time represented in the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> format.
     * @type {DATE_TIME}
     */
    ProbationEnds{
        get {
            if(!this.HasProp("__ProbationEnds"))
                this.__ProbationEnds := DATE_TIME(this.ptr + 80)
            return this.__ProbationEnds
        }
    }

    /**
     * <b>TRUE</b>, if the DHCPv4 client is quarantine-enabled; Otherwise, it is <b>FALSE</b>.
     * @type {Integer}
     */
    QuarantineCapable {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Integer flag value that specifies the status of the link-layer filter.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILTER_STATUS_NONE"></a><a id="filter_status_none"></a><dl>
     * <dt><b>FILTER_STATUS_NONE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client MAC address does not match any filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST"></a><a id="filter_status_full_match_in_allow_list"></a><dl>
     * <dt><b>FILTER_STATUS_FULL_MATCH_IN_ALLOW_LIST</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCv4P client MAC address fully matches an allow list filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILTER_STATUS_FULL_MATCH_IN_DENY_LIST"></a><a id="filter_status_full_match_in_deny_list"></a><dl>
     * <dt><b>FILTER_STATUS_FULL_MATCH_IN_DENY_LIST</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client MAC address fully matches a deny list filter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST"></a><a id="filter_status_wildcard_match_in_allow_list"></a><dl>
     * <dt><b>FILTER_STATUS_WILDCARD_MATCH_IN_ALLOW_LIST</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client MAC address has a wild card match in the allow list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST_"></a><a id="filter_status_wildcard_match_in_deny_list_"></a><dl>
     * <dt><b>FILTER_STATUS_WILDCARD_MATCH_IN_DENY_LIST </b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DHCPv4 client MAC address has a wild card match in the deny list.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    FilterStatus {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCP server policy name that resulted in the IPv4 address assignment to the DHCPv4 client in the lease.
     * @type {Pointer<Char>}
     */
    PolicyName {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
