#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines an individual network binding for the DHCP server. A single DHCP server can contain multiple bindings and serve multiple networks.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_bind_element
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_BIND_ELEMENT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies a set of bit flags indicating properties of the network binding.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DHCP_ENDPOINT_FLAG_CANT_MODIFY"></a><a id="dhcp_endpoint_flag_cant_modify"></a><dl>
     * <dt><b>DHCP_ENDPOINT_FLAG_CANT_MODIFY</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The binding specified in this structure cannot be modified.
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
     * Specifies whether or not this binding is set on the DHCP server. If <b>TRUE</b>, the binding is set; if <b>FALSE</b>, it is not.
     * @type {Integer}
     */
    fBoundToDHCPServer {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address assigned to the ethernet adapter of the DHCP server.
     * @type {Integer}
     */
    AdapterPrimaryAddress {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet IP mask used by this ethernet adapter.
     * @type {Integer}
     */
    AdapterSubnetAddress {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Unicode string that specifies the name assigned to this network interface device.
     * @type {Pointer<Char>}
     */
    IfDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the size of the network interface device ID, in bytes.
     * @type {Integer}
     */
    IfIdSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the network interface device ID.
     * @type {Pointer<Byte>}
     */
    IfId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
