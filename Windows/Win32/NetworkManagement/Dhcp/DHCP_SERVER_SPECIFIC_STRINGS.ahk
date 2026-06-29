#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the default string values for user and vendor class names.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_server_specific_strings
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SERVER_SPECIFIC_STRINGS {
    #StructPack 8

    /**
     * Pointer to a Unicode string that specifies the default vendor class name for the DHCP server.
     */
    DefaultVendorClassName : PWSTR

    /**
     * Pointer to a Unicode string that specifies the default user class name for the DHCP server.
     */
    DefaultUserClassName : PWSTR

}
