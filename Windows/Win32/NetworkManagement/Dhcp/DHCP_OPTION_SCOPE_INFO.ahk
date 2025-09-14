#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_RESERVED_SCOPE.ahk

/**
 * The DHCP_OPTION_SCOPE_INFO structure defines information about the options provided for a certain DHCP scope.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_option_scope_info
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_SCOPE_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type">DHCP_OPTION_SCOPE_TYPE</a> enumeration value that defines the scope type of the associated DHCP options, and indicates which of the following fields in the union will be populated.
     * @type {Integer}
     */
    ScopeType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    DefaultScopeInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    GlobalScopeInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    SubnetScopeInfo {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DHCP_RESERVED_SCOPE}
     */
    ReservedScopeInfo{
        get {
            if(!this.HasProp("__ReservedScopeInfo"))
                this.__ReservedScopeInfo := DHCP_RESERVED_SCOPE(this.ptr + 8)
            return this.__ReservedScopeInfo
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    MScopeInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
