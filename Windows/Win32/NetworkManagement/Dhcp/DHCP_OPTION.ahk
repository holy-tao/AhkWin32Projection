#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_OPTION_TYPE.ahk" { DHCP_OPTION_TYPE }
#Import ".\DHCP_OPTION_DATA_ELEMENT.ahk" { DHCP_OPTION_DATA_ELEMENT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_OPTION_DATA.ahk" { DHCP_OPTION_DATA }

/**
 * The DHCP_OPTION structure defines a single DHCP option and any data elements associated with it.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_OPTION_ID</a> value that specifies a unique ID number (also called a "code") for this option.
     */
    OptionID : UInt32

    /**
     * Unicode string that contains the name of this option.
     */
    OptionName : PWSTR

    /**
     * Unicode string that contains a comment about this option.
     */
    OptionComment : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_data">DHCP_OPTION_DATA</a> structure that contains the data associated with this option.
     */
    DefaultValue : DHCP_OPTION_DATA

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_type">DHCP_OPTION_TYPE</a> enumeration value that indicates whether this option is a single unary item or an element in an array of options.
     */
    OptionType : DHCP_OPTION_TYPE

}
