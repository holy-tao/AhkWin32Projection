#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_RESERVED_SCOPE6.ahk" { DHCP_RESERVED_SCOPE6 }
#Import ".\DHCP_IPV6_ADDRESS.ahk" { DHCP_IPV6_ADDRESS }
#Import ".\DHCP_OPTION_SCOPE_TYPE6.ahk" { DHCP_OPTION_SCOPE_TYPE6 }

/**
 * Defines the data associated with a DHCP option scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_SCOPE_INFO6 {
    #StructPack 8


    struct DHCP_OPTION_SCOPE_UNION6 {
        DefaultScopeInfo : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'SubnetScopeInfo', { type: DHCP_IPV6_ADDRESS, offset: 0 })
            DefineProp(this.Prototype, 'ReservedScopeInfo', { type: DHCP_RESERVED_SCOPE6, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type6">DHCP_OPTION_SCOPE_TYPE6</a> enumeration value that indicates the type of the DHCP option. This value is used as the selector for the union arms listed in the following fields.
     */
    ScopeType : DHCP_OPTION_SCOPE_TYPE6

    ScopeInfo : DHCP_OPTION_SCOPE_INFO6.DHCP_OPTION_SCOPE_UNION6

}
