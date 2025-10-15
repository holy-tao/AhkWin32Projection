#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines a subnet entry within the superscope table.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_super_scope_table_entry
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUPER_SCOPE_TABLE_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address of the gateway for the subnet. This address is used to uniquely identify a subnet served by the DHCP server.
     * @type {Integer}
     */
    SubnetAddress {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the index value assigned to this subnet entry, and its enumerated position within the super scope table.
     * @type {Integer}
     */
    SuperScopeNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the index value of the next subnet entry in the superscope table. If this value is ---, this table entry is the last one in the super scope.
     * @type {Integer}
     */
    NextInSuperScope {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Unicode string that contains the name assigned to this subnet entry within the superscope.
     * @type {PWSTR}
     */
    SuperScopeName{
        get {
            if(!this.HasProp("__SuperScopeName"))
                this.__SuperScopeName := PWSTR(this.ptr + 16)
            return this.__SuperScopeName
        }
    }
}
