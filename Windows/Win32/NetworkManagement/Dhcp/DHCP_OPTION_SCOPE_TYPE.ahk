#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DHCP_OPTION_SCOPE_TYPE enumeration defines the set of possible DHCP option scopes.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_SCOPE_TYPE{

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
