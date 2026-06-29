#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_INFO_V6.ahk" { DHCP_CLIENT_INFO_V6 }

/**
 * Defines an array of DHCP_CLIENT_INFO_V6 structures for use with DHCPv6 client enumeration functions.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_ARRAY_V6 {
    #StructPack 8

    /**
     * Specifies the number of elements present in <b>Clients</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v6">DHCP_CLIENT_INFO_V6</a> structures that contain information on specific DHCPv6 subnet clients, including the dynamic address type (DHCP and/or BOOTP) and address state information.
     */
    Clients : IntPtr

}
