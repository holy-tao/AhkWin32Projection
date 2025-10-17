#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk
#Include .\DATE_TIME.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * The DHCPV4_FAILOVER_CLIENT_INFO structure defines DHCP server scope statistics that are part of a failover relationship.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcpv4_failover_client_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV4_FAILOVER_CLIENT_INFO extends Win32Struct
{
    static sizeof => 136

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
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_MASK</a> structure that contains the DHCPv4 client IPv4 subnet mask.
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
                this.__ClientHardwareAddress := DHCP_BINARY_DATA(8, this)
            return this.__ClientHardwareAddress
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCPv4 client machine name.
     * @type {PWSTR}
     */
    ClientName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the description of the DHCPv4 client.
     * @type {PWSTR}
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
                this.__ClientLeaseExpires := DATE_TIME(40, this)
            return this.__ClientLeaseExpires
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info">DHCP_HOST_INFO</a> structure that contains information about the host machine (DHCPv4 server) that provided a lease to the DHCPv4 client.
     * @type {DHCP_HOST_INFO}
     */
    OwnerHost{
        get {
            if(!this.HasProp("__OwnerHost"))
                this.__OwnerHost := DHCP_HOST_INFO(48, this)
            return this.__OwnerHost
        }
    }

    /**
     * Value that specifies the DHCPv4 client type. The possible values are below.
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
     * Value that specifies various states of the IPv4 address. The LSB is bit 0 and the MSB is bit 7. The possible values are below.
     * 
     * BIT 0 and BIT 1 signify the DHCPv4 client IPv4 address state, as shown in the following table.
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
     *  
     * 
     * BIT 2 and BIT 3 signify information related to Name Protection for the leased IPv4 address, as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_NO_DHCID"></a><a id="address_bit_no_dhcid"></a><dl>
     * <dt><b>ADDRESS_BIT_NO_DHCID</b></dt>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is leased to the DHCPv4 client without <i>DHCID</i> as defined in sections 3 and 3.5 of <a href="http://www.faqs.org/rfcs/rfc4701.html">RFC4701</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_DHCID_NO_CLIENTIDOPTION"></a><a id="address_bit_dhcid_no_clientidoption"></a><dl>
     * <dt><b>ADDRESS_BIT_DHCID_NO_CLIENTIDOPTION</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is leased to the DHCPv4 client with <i>DHCID</i> but without the client ID option as defined in sections 3 and 3.5 of <a href="http://www.faqs.org/rfcs/rfc4701.html">RFC4701</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_DHCID_WITH_CLIENTIDOPTION"></a><a id="address_bit_dhcid_with_clientidoption"></a><dl>
     * <dt><b>ADDRESS_BIT_DHCID_WITH_CLIENTIDOPTION</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is leased to the DHCPv4 client with <i>DHCID</i> and the client ID option as defined in sections 3 and 3.5 of <a href="http://www.faqs.org/rfcs/rfc4701.html">RFC4701</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_DHCID_WITH_DUID"></a><a id="address_bit_dhcid_with_duid"></a><dl>
     * <dt><b>ADDRESS_BIT_DHCID_WITH_DUID</b></dt>
     * <dt>0x3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address is leased to the DHCPv4 client with <i>DHCID</i> and the client DUID and as defined in sections 3 and 3.5 of <a href="http://www.faqs.org/rfcs/rfc4701.html">RFC4701</a>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * BIT 4, BIT 5, BIT 6, and BIT 7 specify information related to DNS, as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_CLEANUP"></a><a id="address_bit_cleanup"></a><dl>
     * <dt><b>ADDRESS_BIT_CLEANUP</b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS update for the DHCPv4 client lease record needs to be deleted from the DNS server when the lease is deleted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_BOTH_REC"></a><a id="address_bit_both_rec"></a><dl>
     * <dt><b>ADDRESS_BIT_BOTH_REC</b></dt>
     * <dt>0x2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS update needs to be sent for both <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_a_data">DNS_A_DATA</a> and <a href="https://docs.microsoft.com/windows/win32/api/windns/ns-windns-dns_ptr_dataw">DNS_PTR_DATA</a> type resource records.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_UNREGISTERED"></a><a id="address_bit_unregistered"></a><dl>
     * <dt><b>ADDRESS_BIT_UNREGISTERED</b></dt>
     * <dt>0x4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The DNS update is not complete for the lease record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ADDRESS_BIT_DELETED"></a><a id="address_bit_deleted"></a><dl>
     * <dt><b>ADDRESS_BIT_DELETED</b></dt>
     * <dt>0x8</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The address lease is expired, but the DNS updates for the lease record have not been deleted from the DNS server.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-quarantinestatus">QuarantineStatus</a> enumeration that specifies possible health status values for the DHCPv4 client as validated at the NAP server.
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
                this.__ProbationEnds := DATE_TIME(80, this)
            return this.__ProbationEnds
        }
    }

    /**
     * <b>TRUE</b>, if the DHCPv4 client is quarantine-enabled; Otherwise, it is <b>FALSE</b>.
     * @type {BOOL}
     */
    QuarantineCapable {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Time, in seconds, of potential-expiration-time sent to the partner server.
     * @type {Integer}
     */
    SentPotExpTime {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Time, in seconds, of potential-expiration-time acknowledged by the partner server.
     * @type {Integer}
     */
    AckPotExpTime {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Time, in seconds, of potential-expiration-time received from the partner server.
     * @type {Integer}
     */
    RecvPotExpTime {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Time, in seconds, since the client lease first entered into its current state.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Time, in seconds, since the client-last-transaction-time.
     * @type {Integer}
     */
    CltLastTransTime {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Time, in seconds, since the partner server last updated the DHCPv4 client lease.
     * @type {Integer}
     */
    LastBndUpdTime {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    BndMsgStatus {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCP server policy name that resulted in the IPv4 address assignment to the DHCPv4 client in the lease.
     * @type {PWSTR}
     */
    PolicyName {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Reserved. Do not use.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 128, "char")
        set => NumPut("char", value, this, 128)
    }
}
