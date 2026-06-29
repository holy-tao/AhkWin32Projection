#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_OPTION.ahk" { DHCP_OPTION }

/**
 * The DHCP_OPTION_ARRAY structure defines an array of DHCP server options.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_ARRAY {
    #StructPack 8

    /**
     * Specifies the number of option elements in <b>Options</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option">DHCP_OPTION</a> structures containing DHCP server options and the associated data.
     */
    Options : DHCP_OPTION.Ptr

}
