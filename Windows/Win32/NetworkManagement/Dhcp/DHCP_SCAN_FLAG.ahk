#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_SCAN_FLAG enumeration defines the set of possible targets of synchronization during a database scan operation.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcp_scan_flag
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SCAN_FLAG extends Win32Enum{

    /**
     * Indicates that the in-memory client lease cache on the DHCPv4 server does not contain the client lease IP address, but the DHCPv4 client lease database does contain it. (Note that this enumeration does not inform <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/nf-dhcpsapi-dhcpscandatabase">DhcpScanDatabase</a> to perform a registry operation despite the name.) Any reconciliation process should update the in-memory cache.
     * @type {Integer (Int32)}
     */
    static DhcpRegistryFix => 0

    /**
     * Indicates that the client lease database on the DHCPv4 server does not contain the client lease IP address, but the in-memory cache of client leases  does contain it. Any reconciliation process should update the database.
     * @type {Integer (Int32)}
     */
    static DhcpDatabaseFix => 1
}
