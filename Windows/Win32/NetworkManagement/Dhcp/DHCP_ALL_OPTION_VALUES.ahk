#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of all option values defined on a DHCP server, organized according to class/vendor pairing.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_all_option_values
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_ALL_OPTION_VALUES {
    #StructPack 8

    /**
     * Reserved. This field should be set to 0.
     */
    Flags : UInt32

    /**
     * Specifies the number of elements in <b>Options</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of [DHCP_OPTION_VALUE_ARRAY](/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array) structures that contain the option values for specific class/vendor pairs.
     */
    Options : _Anonymous.Ptr

}
