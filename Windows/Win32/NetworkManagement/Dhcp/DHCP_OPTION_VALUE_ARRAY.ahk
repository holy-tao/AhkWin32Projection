#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_OPTION_VALUE.ahk" { DHCP_OPTION_VALUE }

/**
 * The DHCP_OPTION_VALUE_ARRAY structure defines a list of DHCP option values (just the option data with associated ID tags).
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_VALUE_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of option values listed in <b>Values</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value">DHCP_OPTION_VALUE</a> structures containing DHCP  option values.
     */
    Values : DHCP_OPTION_VALUE.Ptr

}
