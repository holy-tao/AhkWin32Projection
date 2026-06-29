#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_OPTION_DATA_ELEMENT.ahk" { DHCP_OPTION_DATA_ELEMENT }

/**
 * The DHCP_OPTION_DATA structure defines a data container for one or more data elements associated with a DHCP option.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_DATA {
    #StructPack 8

    /**
     * Specifies the number of option data elements listed in <b>Elements</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data_element">DHCP_OPTION_DATA_ELEMENT</a> structures that contain the data elements associated with this particular option element.
     */
    Elements : DHCP_OPTION_DATA_ELEMENT.Ptr

}
