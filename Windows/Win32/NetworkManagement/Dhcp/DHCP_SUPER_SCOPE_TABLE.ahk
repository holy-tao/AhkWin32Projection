#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the superscope of a DHCP server.
 * @remarks
 * A "superscope" is the set of all subnets defined on a DHCP server, and hence all scopes along with the IP address ranges each serves. Taken altogether, it provides a complete set of all IP addresses served by the DHCP server. The superscope table will only provide the IP addresses associated with each subnet; to obtain the IP ranges served by each, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpgetsubnetinfo">DhcpGetSubnetInfo</a> should be called on the IP address provided in each <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_super_scope_table_entry">DHCP_SUPER_SCOPE_TABLE_ENTRY</a> structure of the table.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_super_scope_table
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUPER_SCOPE_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of subnets (and therefore scopes) present in the super scope.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_super_scope_table_entry">DHCP_SUPER_SCOPE_TABLE_ENTRY</a> structures containing the names and IP addresses of each subnet defined within the superscope.
     * @type {Pointer<DHCP_SUPER_SCOPE_TABLE_ENTRY>}
     */
    pEntries {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
