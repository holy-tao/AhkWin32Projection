#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines an IPv6 interface binding for the DHCP server over which it receives DHCPv6 packets.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcpv6_bind_element
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6_BIND_ELEMENT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A set of bit flags indicating properties of the interface binding.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ENDPOINT_FLAG_CANT_MODIFY_"></a><a id="dhcp_endpoint_flag_cant_modify_"></a><dl>
     * <dt><b>DHCP_ENDPOINT_FLAG_CANT_MODIFY
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The endpoints cannot be modified.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If <b>TRUE</b>, the interface is bound to the DHCPv6 server; if <b>FALSE</b>, it is not.
     * @type {BOOL}
     */
    fBoundToDHCPServer{
        get {
            if(!this.HasProp("__fBoundToDHCPServer"))
                this.__fBoundToDHCPServer := BOOL(this.ptr + 4)
            return this.__fBoundToDHCPServer
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address assigned to the interface over which the DHCP server is receiving DHCPv6 packets.
     * @type {DHCP_IPV6_ADDRESS}
     */
    AdapterPrimaryAddress{
        get {
            if(!this.HasProp("__AdapterPrimaryAddress"))
                this.__AdapterPrimaryAddress := DHCP_IPV6_ADDRESS(this.ptr + 8)
            return this.__AdapterPrimaryAddress
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 prefix ID of the subnet from which this interface is receiving DHCPv6 packets.
     * @type {DHCP_IPV6_ADDRESS}
     */
    AdapterSubnetAddress{
        get {
            if(!this.HasProp("__AdapterSubnetAddress"))
                this.__AdapterSubnetAddress := DHCP_IPV6_ADDRESS(this.ptr + 24)
            return this.__AdapterSubnetAddress
        }
    }

    /**
     * Pointer to a null-terminated Unicode string that specifies the name assigned to this interface.
     * @type {PWSTR}
     */
    IfDescription{
        get {
            if(!this.HasProp("__IfDescription"))
                this.__IfDescription := PWSTR(this.ptr + 40)
            return this.__IfDescription
        }
    }

    /**
     * Integer that specifies the IPv6 interface index of the current interface.
     * @type {Integer}
     */
    IpV6IfIndex {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Integer that specifies the size of the interface GUID stored in <b>IfId</b>.
     * @type {Integer}
     */
    IfIdSize {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Pointer to a BYTE blob that contains the GUID value assigned to this interface.
     * @type {Pointer<Byte>}
     */
    IfId {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
