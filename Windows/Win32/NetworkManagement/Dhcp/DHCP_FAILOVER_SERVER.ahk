#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_FAILOVER_SERVER enumeration defines whether the DHCP server is the primary or secondary server in a DHCPv4 failover relationship.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcp_failover_server
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FAILOVER_SERVER extends Win32Enum{

    /**
     * The server is a primary server in the failover relationship.
     * @type {Integer (Int32)}
     */
    static PrimaryServer => 0

    /**
     * The server is a secondary server in the failover relationship.
     * @type {Integer (Int32)}
     */
    static SecondaryServer => 1
}
