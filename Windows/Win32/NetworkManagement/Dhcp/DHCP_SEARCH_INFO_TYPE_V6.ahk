#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of possible attributes used to search DHCPv6 client information records.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_search_info_type_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SEARCH_INFO_TYPE_V6{

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
