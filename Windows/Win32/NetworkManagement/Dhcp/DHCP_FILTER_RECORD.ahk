#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_ADDR_PATTERN.ahk" { DHCP_ADDR_PATTERN }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information for a specific link-layer filter.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_record
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FILTER_RECORD {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern">DHCP_ADDR_PATTERN</a> structure that contains the address/pattern related information of the link-layer filter.
     */
    AddrPatt : DHCP_ADDR_PATTERN

    /**
     * Pointer to a null-terminated Unicode string which contains the comment associated with the address/pattern.
     */
    Comment : PWSTR

}
