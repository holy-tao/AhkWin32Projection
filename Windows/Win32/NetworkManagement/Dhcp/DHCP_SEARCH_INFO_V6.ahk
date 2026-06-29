#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_SEARCH_INFO_TYPE_V6.ahk" { DHCP_SEARCH_INFO_TYPE_V6 }
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * Contains the term or value on which the DHCPv6 server database will be searched.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SEARCH_INFO_V6 {
    #StructPack 8


    struct _DHCP_CLIENT_SEARCH_UNION_V6 {
        ClientIpAddress : DHCP_IPV6_ADDRESS

        static __New() {
            DefineProp(this.Prototype, 'ClientDUID', { type: DHCP_BINARY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'ClientName', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Enumeration value that selects the type of the value on which the DHCPv6 database will be searched.
     */
    SearchType : DHCP_SEARCH_INFO_TYPE_V6

    SearchInfo : DHCP_SEARCH_INFO_V6._DHCP_CLIENT_SEARCH_UNION_V6

}
