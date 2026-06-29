#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DHCP_OPTION_SCOPE_TYPE enumeration defines the set of possible DHCP option scopes.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_SCOPE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The DHCP options correspond to the default scope.
     * @type {Integer (Int32)}
     */
    static DhcpDefaultOptions => 0

    /**
     * The  DHCP options correspond to the global scope.
     * @type {Integer (Int32)}
     */
    static DhcpGlobalOptions => 1

    /**
     * The  DHCP options correspond to a specific subnet scope.
     * @type {Integer (Int32)}
     */
    static DhcpSubnetOptions => 2

    /**
     * The DHCP options correspond to a reserved IP address.
     * @type {Integer (Int32)}
     */
    static DhcpReservedOptions => 3

    /**
     * The DHCP options correspond to a multicast scope.
     * @type {Integer (Int32)}
     */
    static DhcpMScopeOptions => 4
}
