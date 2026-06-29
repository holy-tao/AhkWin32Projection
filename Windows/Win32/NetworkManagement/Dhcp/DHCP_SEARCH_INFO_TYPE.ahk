#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible attributes used to search DHCP client information records.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_search_info_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SEARCH_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The search will be performed against the assigned DHCP client IP address, represented as a 32-bit unsigned integer value.
     * @type {Integer (Int32)}
     */
    static DhcpClientIpAddress => 0

    /**
     * The search will be performed against the MAC address of the DHCP client network interface device, represented as a <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_BINARY_DATA</a> structure.
     * @type {Integer (Int32)}
     */
    static DhcpClientHardwareAddress => 1

    /**
     * The search will be performed against the DHCP client's network name, represented as a Unicode string.
     * @type {Integer (Int32)}
     */
    static DhcpClientName => 2
}
