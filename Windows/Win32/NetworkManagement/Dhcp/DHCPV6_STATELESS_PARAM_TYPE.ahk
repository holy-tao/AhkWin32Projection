#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCPV6_STATELESS_PARAM_TYPE enumeration defines a DHCPv6 stateless client inventory configuration parameter type.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcpv6_stateless_param_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_STATELESS_PARAM_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The parameter type is the purge interval for client lease records from the DHCP server database.
     * @type {Integer (Int32)}
     */
    static DhcpStatelessPurgeInterval => 1

    /**
     * The parameter type is the client inventory enabled/disabled status in the DHCP server database.
     * @type {Integer (Int32)}
     */
    static DhcpStatelessStatus => 2
}
