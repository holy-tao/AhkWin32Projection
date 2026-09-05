#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_SUBNET_STATE enumeration defines the set of possible states for a subnet.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_subnet_state
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_SUBNET_STATE extends Win32Enum {

    /**
     * The subnet is enabled; the server will distribute addresses, extend leases, and release addresses within the subnet range to clients.
     * Native name: DhcpSubnetEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * The subnet is disabled; the server will not distribute addresses or extend leases within the subnet range to clients. However, the server will still release addresses within the subnet range.
     * Native name: DhcpSubnetDisabled
     * @type {Integer (Int32)}
     */
    static Disabled => 1

    /**
     * The subnet is enabled; the server will distribute addresses, extend leases, and release addresses within the subnet range to clients. The default gateway is set to the local machine itself.
     * Native name: DhcpSubnetEnabledSwitched
     * @type {Integer (Int32)}
     */
    static EnabledSwitched => 2

    /**
     * The subnet is disabled; the server will not distribute addresses or extend leases within the subnet range to clients. However, the server will still release addresses within the subnet range. The default gateway is set to the local machine itself.
     * Native name: DhcpSubnetDisabledSwitched
     * @type {Integer (Int32)}
     */
    static DisabledSwitched => 3

    /**
     * The subnet is in an invalid state.
     * Native name: DhcpSubnetInvalidState
     * @type {Integer (Int32)}
     */
    static InvalidState => 4
}
