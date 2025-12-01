#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_BINARY_DATA.ahk
#Include .\DATE_TIME.ahk
#Include .\DHCP_HOST_INFO.ahk

/**
 * Defines a client information record used by the DHCP server, extending the definition provided in DHCP_CLIENT_INFO by including client type information.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v4
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLIENT_INFO_V4 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the assigned IP address of the DHCP client.
     * @type {Integer}
     */
    ClientIpAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_MASK</a> value that contains the subnet mask value assigned to the DHCP client.
     * @type {Integer}
     */
    SubnetMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure containing the MAC address of the client's network interface device.
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
     * Unicode string that specifies the network name of the DHCP client. This member is optional.
     * @type {PWSTR}
     */
    ClientName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Unicode string that contains a comment associated with the DHCP client. This member is optional.
     * @type {PWSTR}
     */
    ClientComment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> structure that contains the date and time the DHCP client lease will expire, in UTC time.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info">DHCP_HOST_INFO</a> structure that contains information on the DHCP server that assigned the IP address to the  client.
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
     * @type {Integer}
     */
    bClientType {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }
}
