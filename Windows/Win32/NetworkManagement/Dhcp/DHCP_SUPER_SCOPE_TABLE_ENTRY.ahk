#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Defines a subnet entry within the superscope table.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_super_scope_table_entry
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUPER_SCOPE_TABLE_ENTRY {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value that specifies the IP address of the gateway for the subnet. This address is used to uniquely identify a subnet served by the DHCP server.
     */
    SubnetAddress : UInt32

    /**
     * Specifies the index value assigned to this subnet entry, and its enumerated position within the super scope table.
     */
    SuperScopeNumber : UInt32

    /**
     * Specifies the index value of the next subnet entry in the superscope table. If this value is ---, this table entry is the last one in the super scope.
     */
    NextInSuperScope : UInt32

    /**
     * Unicode string that contains the name assigned to this subnet entry within the superscope.
     */
    SuperScopeName : PWSTR

}
