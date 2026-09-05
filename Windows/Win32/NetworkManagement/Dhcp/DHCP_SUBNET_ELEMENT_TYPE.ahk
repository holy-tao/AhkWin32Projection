#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_SUBNET_ELEMENT_TYPE enumeration defines the set of possible subnet element types.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_SUBNET_ELEMENT_TYPE extends Win32Enum {

    /**
     * The subnet element contains the range of DHCP-served IP addresses.
     * Native name: DhcpIpRanges
     * @type {Integer (Int32)}
     */
    static IpRanges => 0

    /**
     * The subnet element contains the IP addresses of secondary DHCP hosts available in the subnet.
     * Native name: DhcpSecondaryHosts
     * @type {Integer (Int32)}
     */
    static SecondaryHosts => 1

    /**
     * The subnet element contains the individual reserved IP addresses for the subnet.
     * Native name: DhcpReservedIps
     * @type {Integer (Int32)}
     */
    static ReservedIps => 2

    /**
     * The subnet element contains the IP addresses excluded from the range of DHCP-served addresses.
     * Native name: DhcpExcludedIpRanges
     * @type {Integer (Int32)}
     */
    static ExcludedIpRanges => 3

    /**
     * Native name: DhcpIpUsedClusters
     * @type {Integer (Int32)}
     */
    static IpUsedClusters => 4

    /**
     * The subnet element contains the IP addresses served by DHCP to the subnet (as opposed to those served by other dynamic address services, such as BOOTP).
     * Native name: DhcpIpRangesDhcpOnly
     * @type {Integer (Int32)}
     */
    static IpRangesDhcpOnly => 5

    /**
     * The subnet element contains the IP addresses served by both DHCP and BOOTP to the subnet.
     * Native name: DhcpIpRangesDhcpBootp
     * @type {Integer (Int32)}
     */
    static IpRangesDhcpBootp => 6

    /**
     * The subnet element contains the IP addresses served by BOOTP to the subnet (specifically excluding DHCP-served addresses).
     * Native name: DhcpIpRangesBootpOnly
     * @type {Integer (Int32)}
     */
    static IpRangesBootpOnly => 7
}
