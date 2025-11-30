#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_OPTION_DATA_TYPE enumeration defines the set of formats that represent DHCP option data.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcp_option_data_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_DATA_TYPE extends Win32Enum{

    /**
     * The option data is stored as a BYTE value.
     * @type {Integer (Int32)}
     */
    static DhcpByteOption => 0

    /**
     * The option data is stored as a WORD value.
     * @type {Integer (Int32)}
     */
    static DhcpWordOption => 1

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
     * @type {Integer (Int32)}
     */
    static DhcpIpAddressOption => 4

    /**
     * The option data is stored as a Unicode string.
     * @type {Integer (Int32)}
     */
    static DhcpStringDataOption => 5

    /**
     * The option data is stored as a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_BINARY_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DhcpBinaryDataOption => 6

    /**
     * The option data is encapsulated and stored as a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_BINARY_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DhcpEncapsulatedDataOption => 7

    /**
     * The option data is stored as a Unicode string.
     * @type {Integer (Int32)}
     */
    static DhcpIpv6AddressOption => 8
}
