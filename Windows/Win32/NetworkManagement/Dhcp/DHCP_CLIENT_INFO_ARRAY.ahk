#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_INFO.ahk" { DHCP_CLIENT_INFO }

/**
 * The DHCP_CLIENT_INFO_ARRAY structure defines an array of DHCP_CLIENT_INFO structures for use with enumeration functions.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of elements present in <b>Clients</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info">DHCP_CLIENT_INFO</a> structures that contain information on specific DHCP subnet clients.).
     */
    Clients : IntPtr

}
