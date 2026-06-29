#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_SEARCH_INFO_TYPE.ahk" { DHCP_SEARCH_INFO_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_BINARY_DATA.ahk" { DHCP_BINARY_DATA }

/**
 * The DHCP_SEARCH_INFO structure defines the DHCP client record data used to search against for particular server operations.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_search_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SEARCH_INFO {
    #StructPack 8


    struct DHCP_CLIENT_SEARCH_UNION {
        ClientIpAddress : UInt32

        static __New() {
            DefineProp(this.Prototype, 'ClientHardwareAddress', { type: DHCP_BINARY_DATA, offset: 0 })
            DefineProp(this.Prototype, 'ClientName', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_search_info_type">DHCP_SEARCH_INFO_TYPE</a> enumeration value that specifies the data included in the subsequent member of this structure.
     */
    SearchType : DHCP_SEARCH_INFO_TYPE

    SearchInfo : DHCP_SEARCH_INFO.DHCP_CLIENT_SEARCH_UNION

}
