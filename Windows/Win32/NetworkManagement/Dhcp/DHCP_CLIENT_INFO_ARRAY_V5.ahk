#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_INFO_V5.ahk" { DHCP_CLIENT_INFO_V5 }

/**
 * Defines an array of DHCP_CLIENT_INFO_V5 structures for use with enumeration functions.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_ARRAY_V5 {
    #StructPack 8

    /**
     * Specifies the number of elements present in <b>Clients</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_v5">DHCP_CLIENT_INFO_V5</a> structures that contain information on specific DHCP subnet clients, including the dynamic address type (DHCP and/or BOOTP) and address state information.
     */
    Clients : IntPtr

}
