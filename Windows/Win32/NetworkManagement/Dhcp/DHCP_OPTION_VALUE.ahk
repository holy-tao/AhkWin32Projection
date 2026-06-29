#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_OPTION_DATA_ELEMENT.ahk" { DHCP_OPTION_DATA_ELEMENT }
#Import ".\DHCP_OPTION_DATA.ahk" { DHCP_OPTION_DATA }

/**
 * The DHCP_OPTION_VALUE structure defines a DHCP option value (just the option data with an associated ID tag).
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_VALUE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies a unique ID number for the option.
     */
    OptionID : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data for a DHCP server option.
     */
    Value : DHCP_OPTION_DATA

}
