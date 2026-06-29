#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Defines an IPv6 interface binding for the DHCP server over which it receives DHCPv6 packets.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_bind_element
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_BIND_ELEMENT {
    #StructPack 8

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
     */
    Flags : UInt32

    /**
     * If <b>TRUE</b>, the interface is bound to the DHCPv6 server; if <b>FALSE</b>, it is not.
     */
    fBoundToDHCPServer : BOOL

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address assigned to the interface over which the DHCP server is receiving DHCPv6 packets.
     */
    AdapterPrimaryAddress : DHCP_IPV6_ADDRESS

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 prefix ID of the subnet from which this interface is receiving DHCPv6 packets.
     */
    AdapterSubnetAddress : DHCP_IPV6_ADDRESS

    /**
     * Pointer to a null-terminated Unicode string that specifies the name assigned to this interface.
     */
    IfDescription : PWSTR

    /**
     * Integer that specifies the IPv6 interface index of the current interface.
     */
    IpV6IfIndex : UInt32

    /**
     * Integer that specifies the size of the interface GUID stored in <b>IfId</b>.
     */
    IfIdSize : UInt32

    /**
     * Pointer to a BYTE blob that contains the GUID value assigned to this interface.
     */
    IfId : IntPtr

}
