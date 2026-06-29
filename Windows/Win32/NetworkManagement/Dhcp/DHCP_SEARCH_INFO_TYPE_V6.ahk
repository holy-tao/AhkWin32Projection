#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible attributes used to search DHCPv6 client information records.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_search_info_type_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SEARCH_INFO_TYPE_V6 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The search will be performed against the assigned DHCPv6 client IPv6 address.
     * @type {Integer (Int32)}
     */
    static Dhcpv6ClientIpAddress => 0

    /**
     * The search will be performed against the DHCPv6 client's DHCP unique ID, represented as a GUID.
     * @type {Integer (Int32)}
     */
    static Dhcpv6ClientDUID => 1

    /**
     * The search will be performed against the DHCP client's network name, represented as a Unicode string.
     * @type {Integer (Int32)}
     */
    static Dhcpv6ClientName => 2
}
