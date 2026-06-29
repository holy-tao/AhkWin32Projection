#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_ELEMENT_TYPE_V6 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static Dhcpv6IpRanges => 0

    /**
     * @type {Integer (Int32)}
     */
    static Dhcpv6ReservedIps => 1

    /**
     * @type {Integer (Int32)}
     */
    static Dhcpv6ExcludedIpRanges => 2
}
