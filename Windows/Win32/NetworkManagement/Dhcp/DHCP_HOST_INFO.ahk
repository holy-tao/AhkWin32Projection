#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The DHCP_HOST_INFO structure defines information on a DHCP server (host).
 * @remarks
 * When this structure is populated by the DHCP Server, the <b>HostName</b> and <b>NetBiosName</b> members may be set to <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_host_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_HOST_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that contains the IP address of the DHCP server.
     */
    IpAddress : UInt32

    /**
     * Unicode string that contains the NetBIOS name of the DHCP server.
     */
    NetBiosName : PWSTR

    /**
     * Unicode string that contains the network name of the DHCP server.
     */
    HostName : PWSTR

}
