#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_FAILOVER_MODE enumeration defines the DHCPv4 server mode operation in a failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_mode
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FAILOVER_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
