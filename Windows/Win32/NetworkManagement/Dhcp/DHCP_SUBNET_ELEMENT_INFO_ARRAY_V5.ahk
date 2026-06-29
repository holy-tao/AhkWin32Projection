#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SUBNET_ELEMENT_DATA_V5.ahk" { DHCP_SUBNET_ELEMENT_DATA_V5 }

/**
 * The DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5 structure defines an array of subnet element data. Element data in the V5 structure is BOOTP specific.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array_v5
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_ELEMENT_INFO_ARRAY_V5 {
    #StructPack 8

    /**
     * Specifies the number of elements in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data_v5">DHCP_SUBNET_ELEMENT_DATA_V5</a> structures that contain the data for the corresponding subnet elements.
     */
    Elements : DHCP_SUBNET_ELEMENT_DATA_V5.Ptr

}
