#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_ALL_OPTION_VALUES_PB structure defines the set of all option values for a DHCP server within a scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_all_option_values_pb
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_ALL_OPTION_VALUES_PB {
    #StructPack 8

    /**
     * Reserved. Must be 0.
     */
    Flags : UInt32

    /**
     * Integer that specifies the number of elements in <b>Options</b>.
     */
    NumElements : UInt32

    /**
     * Pointer to a list of [DHCP_OPTION_VALUE_ARRAY](/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_value_array) structures that contain the set of all option values for specific vendor/policy pairs. There is one element per pair.
     */
    Options : _Anonymous.Ptr

}
