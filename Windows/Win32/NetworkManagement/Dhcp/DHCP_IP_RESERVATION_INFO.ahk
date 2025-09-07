#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk

/**
 * The DHCP_IP_RESERVATION_INFO structure defines an IPv4 reservation for a DHCPv4 client.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_IP_RESERVATION_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> structure that contains the reserved IP address.
     * @type {Integer}
     */
    ReservedIpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure that contains the hardware address (MAC address) of the DHCPv4 client that holds this reservation.
     * @type {DHCP_BINARY_DATA}
     */
    ReservedForClient{
        get {
            if(!this.HasProp("__ReservedForClient"))
                this.__ReservedForClient := DHCP_BINARY_DATA(this.ptr + 8)
            return this.__ReservedForClient
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the DHCPv4 reserved client machine name.
     * @type {Pointer<Ptr>}
     */
    ReservedClientName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a null-terminated Unicode string that represents the description of the DHCPv4 reserved client.
     * @type {Pointer<Ptr>}
     */
    ReservedClientDesc {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

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
     * @type {Integer}
     */
    bAllowedClientTypes {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * <b>TRUE</b> if  the DHCPv4 reserved client has options configured at reservation level. Otherwise, it is <b>FALSE</b>.
     * @type {Integer}
     */
    fOptionsPresent {
        get => NumGet(this, 41, "char")
        set => NumPut("char", value, this, 41)
    }
}
