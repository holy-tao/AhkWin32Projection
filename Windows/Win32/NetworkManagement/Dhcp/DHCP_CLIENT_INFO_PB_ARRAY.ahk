#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_INFO_PB.ahk" { DHCP_CLIENT_INFO_PB }

/**
 * The DHCP_CLIENT_INFO_PB_ARRAY structure defines an array of DHCPv4 client information elements.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_PB_ARRAY {
    #StructPack 8

    /**
     * Integer that contains the number of DHCPv4 clients in <b>Clients</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_pb">DHCP_CLIENT_INFO_PB</a> structures that contain DHCPv4 client information.
     */
    Clients : IntPtr

}
