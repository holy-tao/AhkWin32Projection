#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_CLIENT_INFO_VQ.ahk" { DHCP_CLIENT_INFO_VQ }

/**
 * Specifies an array of DHCP_CLIENT_INFO_VQ structures.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_array_vq
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_CLIENT_INFO_ARRAY_VQ {
    #StructPack 8

    /**
     * The number of elements in the array.
     */
    NumElements : UInt32

    /**
     * Pointer to the first element in the array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_client_info_vq">DHCP_CLIENT_INFO_VQ</a> structures.
     */
    Clients : IntPtr

}
