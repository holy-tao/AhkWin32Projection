#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_SUBNET_ELEMENT_TYPE enumeration defines the set of possible subnet element types.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_element_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_SUBNET_ELEMENT_TYPE extends Win32Enum{

    /**
     * The subnet element contains the range of DHCP-served IP addresses.
     * @type {Integer (Int32)}
     */
    static DhcpIpRanges => 0

    /**
     * The subnet element contains the IP addresses of secondary DHCP hosts available in the subnet.
     * @type {Integer (Int32)}
     */
    static DhcpSecondaryHosts => 1

    /**
     * The subnet element contains the individual reserved IP addresses for the subnet.
     * @type {Integer (Int32)}
     */
    static DhcpReservedIps => 2

    /**
     * The subnet element contains the IP addresses excluded from the range of DHCP-served addresses.
     * @type {Integer (Int32)}
     */
    static DhcpExcludedIpRanges => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DhcpIpUsedClusters => 4

    /**
     * The subnet element contains the IP addresses served by DHCP to the subnet (as opposed to those served by other dynamic address services, such as BOOTP).
     * @type {Integer (Int32)}
     */
    static DhcpIpRangesDhcpOnly => 5

    /**
     * The subnet element contains the IP addresses served by both DHCP and BOOTP to the subnet.
     * @type {Integer (Int32)}
     */
    static DhcpIpRangesDhcpBootp => 6

    /**
     * The subnet element contains the IP addresses served by BOOTP to the subnet (specifically excluding DHCP-served addresses).
     * @type {Integer (Int32)}
     */
    static DhcpIpRangesBootpOnly => 7
}
