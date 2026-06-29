#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SUBNET_ELEMENT_DATA.ahk" { DHCP_SUBNET_ELEMENT_DATA }

/**
 * Defines an array of subnet element data.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_info_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_ELEMENT_INFO_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of elements in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_subnet_element_data">DHCP_SUBNET_ELEMENT_DATA</a> structures that contain the data for the corresponding subnet elements.
     */
    Elements : DHCP_SUBNET_ELEMENT_DATA.Ptr

}
