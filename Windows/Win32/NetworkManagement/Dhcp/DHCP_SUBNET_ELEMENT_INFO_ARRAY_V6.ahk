#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SUBNET_ELEMENT_DATA_V6.ahk" { DHCP_SUBNET_ELEMENT_DATA_V6 }

/**
 * Contains data that defines an array of DHCP_SUBNET_ELEMENT_DATA_V6 IPv6 prefix elements.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V6 {
    #StructPack 8

    /**
     * A <b>DWORD</b> value containing the number of IPv6 subnet elements in the <b>Elements</b> member.
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v6">DHCP_SUBNET_ELEMENT_DATA_V6</a> structures that contain IPv6 prefix elements.
     */
    Elements : DHCP_SUBNET_ELEMENT_DATA_V6.Ptr

}
