#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk
#Include .\DHCP_RESERVED_SCOPE6.ahk

/**
 * Defines the data associated with a DHCP option scope.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_SCOPE_INFO6 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    class DHCP_OPTION_SCOPE_UNION6 extends Win32Struct {
        static sizeof => 64
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        DefaultScopeInfo {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {DHCP_IPV6_ADDRESS}
         */
        SubnetScopeInfo{
            get {
                if(!this.HasProp("__SubnetScopeInfo"))
                    this.__SubnetScopeInfo := DHCP_IPV6_ADDRESS(0, this)
                return this.__SubnetScopeInfo
            }
        }
    
        /**
         * @type {DHCP_RESERVED_SCOPE6}
         */
        ReservedScopeInfo{
            get {
                if(!this.HasProp("__ReservedScopeInfo"))
                    this.__ReservedScopeInfo := DHCP_RESERVED_SCOPE6(0, this)
                return this.__ReservedScopeInfo
            }
        }
    
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type6">DHCP_OPTION_SCOPE_TYPE6</a> enumeration value that indicates the type of the DHCP option. This value is used as the selector for the union arms listed in the following fields.
     * @type {Integer}
     */
    ScopeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {DHCP_OPTION_SCOPE_UNION6}
     */
    ScopeInfo{
        get {
            if(!this.HasProp("__ScopeInfo"))
                this.__ScopeInfo := %this.__Class%.DHCP_OPTION_SCOPE_UNION6(8, this)
            return this.__ScopeInfo
        }
    }
}
