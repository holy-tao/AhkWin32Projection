#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCP_FAILOVER_RELATIONSHIP_ARRAY structure defines an array of DHCPv4 failover relationships between partner servers.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FAILOVER_RELATIONSHIP_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that specifies the number of DHCPv4 failover relationships in <b>pRelationships.</b>
     * @type {Integer}
     */
    NumElements {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a>  structures.
     * @type {Pointer<DHCP_FAILOVER_RELATIONSHIP>}
     */
    pRelationships {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
