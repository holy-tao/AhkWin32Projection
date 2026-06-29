#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_FAILOVER_SERVER enumeration defines whether the DHCP server is the primary or secondary server in a DHCPv4 failover relationship.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_failover_server
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_FAILOVER_SERVER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
