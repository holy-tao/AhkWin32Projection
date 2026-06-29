#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_SUBNET_STATE enumeration defines the set of possible states for a subnet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_state
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_SUBNET_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The subnet is enabled; the server will distribute addresses, extend leases, and release addresses within the subnet range to clients.
     * @type {Integer (Int32)}
     */
    static DhcpSubnetEnabled => 0

    /**
     * The subnet is disabled; the server will not distribute addresses or extend leases within the subnet range to clients. However, the server will still release addresses within the subnet range.
     * @type {Integer (Int32)}
     */
    static DhcpSubnetDisabled => 1

    /**
     * The subnet is enabled; the server will distribute addresses, extend leases, and release addresses within the subnet range to clients. The default gateway is set to the local machine itself.
     * @type {Integer (Int32)}
     */
    static DhcpSubnetEnabledSwitched => 2

    /**
     * The subnet is disabled; the server will not distribute addresses or extend leases within the subnet range to clients. However, the server will still release addresses within the subnet range. The default gateway is set to the local machine itself.
     * @type {Integer (Int32)}
     */
    static DhcpSubnetDisabledSwitched => 3

    /**
     * The subnet is in an invalid state.
     * @type {Integer (Int32)}
     */
    static DhcpSubnetInvalidState => 4
}
