#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DHCP_FAILOVER_MODE enumeration defines the DHCPv4 server mode operation in a failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_mode
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_FAILOVER_MODE{

    /**
     * The DHCPv4 server failover relationship is in <i>Load Balancing</i> mode.
     * @type {Integer (Int32)}
     */
    static LoadBalance => 0

    /**
     * The DHCPv4 server failover relationship is in <i>Hot Standby</i> mode.
     * @type {Integer (Int32)}
     */
    static HotStandby => 1
}
