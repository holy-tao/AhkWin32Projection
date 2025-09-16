#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk
#Include .\DHCP_BINARY_DATA.ahk
#Include .\DATE_TIME.ahk
#Include .\DHCP_HOST_INFO_V6.ahk

/**
 * The DHCP_CLIENT_INFO_V6 structure contains information on DHCPv6 clients.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_CLIENT_INFO_V6 extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * This is of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> (section 2.2.1.2.28), containing the DHCPv6 client's IPv6 address.
     * @type {DHCP_IPV6_ADDRESS}
     */
    ClientIpAddress{
        get {
            if(!this.HasProp("__ClientIpAddress"))
                this.__ClientIpAddress := DHCP_IPV6_ADDRESS(this.ptr + 0)
            return this.__ClientIpAddress
        }
    }

    /**
     * This is of type DHCP_CLIENT_UID (section 2.2.1.2.5), containing the DHCPv6 client identifier.
     * @type {DHCP_BINARY_DATA}
     */
    ClientDUID{
        get {
            if(!this.HasProp("__ClientDUID"))
                this.__ClientDUID := DHCP_BINARY_DATA(this.ptr + 16)
            return this.__ClientDUID
        }
    }

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
     * @type {Integer}
     */
    AddressType {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * This is of type <b>DWORD</b>, specifying the interface identifier of the DHCPv6 client interface.
     * @type {Integer}
     */
    IAID {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A pointer to a null-terminated Unicode string containing the name of the DHCPv6 client.
     * @type {Pointer<PWSTR>}
     */
    ClientName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a null-terminated Unicode string containing a comment relating to the DHCPv6 client.
     * @type {Pointer<PWSTR>}
     */
    ClientComment {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * This is of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a> (section 2.2.1.2.11), containing the valid lifetime of the DHCPv6 IPv6 client lease.
     * @type {DATE_TIME}
     */
    ClientValidLeaseExpires{
        get {
            if(!this.HasProp("__ClientValidLeaseExpires"))
                this.__ClientValidLeaseExpires := DATE_TIME(this.ptr + 56)
            return this.__ClientValidLeaseExpires
        }
    }

    /**
     * This is of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-date_time">DATE_TIME</a>, containing the preferred lifetime of the DHCPv6 client lease.
     * @type {DATE_TIME}
     */
    ClientPrefLeaseExpires{
        get {
            if(!this.HasProp("__ClientPrefLeaseExpires"))
                this.__ClientPrefLeaseExpires := DATE_TIME(this.ptr + 64)
            return this.__ClientPrefLeaseExpires
        }
    }

    /**
     * This of type <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info_v6">DHCP_HOST_INFO_V6</a> (section 2.2.1.2.63), containing information about the host machine (DHCPv6 server machine) that has given this IPv6 lease to this DHCPv6 client.
     * @type {DHCP_HOST_INFO_V6}
     */
    OwnerHost{
        get {
            if(!this.HasProp("__OwnerHost"))
                this.__OwnerHost := DHCP_HOST_INFO_V6(this.ptr + 72)
            return this.__OwnerHost
        }
    }
}
