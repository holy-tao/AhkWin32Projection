#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_ADDR_PATTERN.ahk" { DHCP_ADDR_PATTERN }
#Import ".\DHCP_FILTER_LIST_TYPE.ahk" { DHCP_FILTER_LIST_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information regarding the link-layer filter to be added to the allow and deny filter list.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_filter_add_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FILTER_ADD_INFO {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_addr_pattern">DHCP_ADDR_PATTERN</a> structure that contains the address/pattern-related information of the link-layer filter.
     */
    AddrPatt : DHCP_ADDR_PATTERN

    /**
     * Pointer to a Unicode string that contains a text comment for the filter.
     */
    Comment : PWSTR

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_filter_list_type">DHCP_FILTER_LIST_TYPE</a> enumeration value that specifies the list type to which the filter is to be added.
     */
    ListType : DHCP_FILTER_LIST_TYPE

}
