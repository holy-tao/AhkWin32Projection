#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCP_FAILOVER_RELATIONSHIP.ahk" { DHCP_FAILOVER_RELATIONSHIP }

/**
 * The DHCP_FAILOVER_RELATIONSHIP_ARRAY structure defines an array of DHCPv4 failover relationships between partner servers.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship_array
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FAILOVER_RELATIONSHIP_ARRAY {
    #StructPack 8

    /**
     * Integer that specifies the number of DHCPv4 failover relationships in <b>pRelationships.</b>
     */
    NumElements : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_failover_relationship">DHCP_FAILOVER_RELATIONSHIP</a>  structures.
     */
    pRelationships : DHCP_FAILOVER_RELATIONSHIP.Ptr

}
