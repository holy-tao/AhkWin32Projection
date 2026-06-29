#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DHCP_RESERVED_SCOPE.ahk" { DHCP_RESERVED_SCOPE }
#Import ".\DHCP_OPTION_SCOPE_TYPE.ahk" { DHCP_OPTION_SCOPE_TYPE }

/**
 * The DHCP_OPTION_SCOPE_INFO structure defines information about the options provided for a certain DHCP scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_SCOPE_INFO {
    #StructPack 8


    struct _DHCP_OPTION_SCOPE_UNION {
        DefaultScopeInfo : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'GlobalScopeInfo', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'SubnetScopeInfo', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'ReservedScopeInfo', { type: DHCP_RESERVED_SCOPE, offset: 0 })
            DefineProp(this.Prototype, 'MScopeInfo', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type">DHCP_OPTION_SCOPE_TYPE</a> enumeration value that defines the scope type of the associated DHCP options, and indicates which of the following fields in the union will be populated.
     */
    ScopeType : DHCP_OPTION_SCOPE_TYPE

    ScopeInfo : DHCP_OPTION_SCOPE_INFO._DHCP_OPTION_SCOPE_UNION

}
