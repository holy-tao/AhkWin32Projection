#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_OPTION_ARRAY.ahk" { DHCP_OPTION_ARRAY }

/**
 * Defines the set of all options available on a DHCP server.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_all_options
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_ALL_OPTIONS {
    #StructPack 8

    /**
     * Reserved. This value should be set to 0.
     */
    Flags : UInt32

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_option_array">DHCP_OPTION_ARRAY</a> structure that contains the set of non-vendor options.
     */
    NonVendorOptions : DHCP_OPTION_ARRAY.Ptr

    /**
     * Specifies the number of vendor options listed in <b>VendorOptions</b>.
     */
    NumVendorOptions : UInt32

    /**
     * Pointer to a list of structures that contain the following fields.
     */
    VendorOptions : _Anonymous.Ptr

}
