#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }

/**
 * Contains network information about a DHCPv6 server (host), such as its IPv6 address and name.
 * @remarks
 * When this structure is populated by the DHCP Server, the <b>HostName</b> and <b>NetBiosName</b> members may be set to <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_HOST_INFO_V6 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address of the DHCPv6 server.
     */
    IpAddress : DHCP_IPV6_ADDRESS

    /**
     * Pointer to a Unicode string that contains the NetBIOS name of the DHCPv6 server.
     */
    NetBiosName : PWSTR

    /**
     * Pointer to a Unicode string that contains the network name of the DHCPv6 server.
     */
    HostName : PWSTR

}
