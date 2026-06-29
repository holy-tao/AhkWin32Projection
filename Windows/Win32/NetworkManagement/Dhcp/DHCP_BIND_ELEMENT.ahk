#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines an individual network binding for the DHCP server. A single DHCP server can contain multiple bindings and serve multiple networks.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_bind_element
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_BIND_ELEMENT {
    #StructPack 8

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
     */
    Flags : UInt32

    /**
     * Specifies whether or not this binding is set on the DHCP server. If <b>TRUE</b>, the binding is set; if <b>FALSE</b>, it is not.
     */
    fBoundToDHCPServer : BOOL

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address assigned to the ethernet adapter of the DHCP server.
     */
    AdapterPrimaryAddress : UInt32

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the subnet IP mask used by this ethernet adapter.
     */
    AdapterSubnetAddress : UInt32

    /**
     * Unicode string that specifies the name assigned to this network interface device.
     */
    IfDescription : PWSTR

    /**
     * Specifies the size of the network interface device ID, in bytes.
     */
    IfIdSize : UInt32

    /**
     * Specifies the network interface device ID.
     */
    IfId : IntPtr

}
