#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_FILTER_STATUS_INFO.ahk" { DHCP_CLIENT_FILTER_STATUS_INFO }

/**
 * Contains an array of information elements for DHCPv4 clients.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_filter_status_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_FILTER_STATUS_INFO_ARRAY {
    #StructPack 8

    /**
     * Integer value that contains the number of DHCPv4 clients in the subsequent field Clients.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of  <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_filter_status_info">DHCP_CLIENT_FILTER_STATUS_INFO</a> structures that contain the DHCPv4 clients'  information.
     */
    Clients : IntPtr

}
