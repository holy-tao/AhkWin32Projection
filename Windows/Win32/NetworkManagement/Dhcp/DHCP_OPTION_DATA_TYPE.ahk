#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_OPTION_DATA_TYPE enumeration defines the set of formats that represent DHCP option data.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_option_data_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_OPTION_DATA_TYPE extends Win32Enum {

    /**
     * The option data is stored as a BYTE value.
     * Native name: DhcpByteOption
     * @type {Integer (Int32)}
     */
    static ByteOption => 0

    /**
     * The option data is stored as a WORD value.
     * Native name: DhcpWordOption
     * @type {Integer (Int32)}
     */
    static WordOption => 1

    /**
     * The option data is stored as a DWORD value.
     * @type {Integer (Int32)}
     */
    static DhcpDWordOption => 2

    /**
     * The option data is stored as a DWORD_DWORD value.
     * @type {Integer (Int32)}
     */
    static DhcpDWordDWordOption => 3

    /**
     * The option data is an IP address, stored as a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/dhcp/dhcp-server-management-type-definitions">DHCP_IP_ADDRESS</a> value (DWORD).
     * Native name: DhcpIpAddressOption
     * @type {Integer (Int32)}
     */
    static IpAddressOption => 4

    /**
     * The option data is stored as a Unicode string.
     * Native name: DhcpStringDataOption
     * @type {Integer (Int32)}
     */
    static StringDataOption => 5

    /**
     * The option data is stored as a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_BINARY_DATA</a> structure.
     * Native name: DhcpBinaryDataOption
     * @type {Integer (Int32)}
     */
    static BinaryDataOption => 6

    /**
     * The option data is encapsulated and stored as a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_BINARY_DATA</a> structure.
     * Native name: DhcpEncapsulatedDataOption
     * @type {Integer (Int32)}
     */
    static EncapsulatedDataOption => 7

    /**
     * The option data is stored as a Unicode string.
     * Native name: DhcpIpv6AddressOption
     * @type {Integer (Int32)}
     */
    static Ipv6AddressOption => 8
}
