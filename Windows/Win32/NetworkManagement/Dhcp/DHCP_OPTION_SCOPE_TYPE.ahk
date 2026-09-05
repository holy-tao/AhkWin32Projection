#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DHCP_OPTION_SCOPE_TYPE enumeration defines the set of possible DHCP option scopes.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
class DHCP_OPTION_SCOPE_TYPE extends Win32Enum {

    /**
     * The DHCP options correspond to the default scope.
     * Native name: DhcpDefaultOptions
     * @type {Integer (Int32)}
     */
    static DefaultOptions => 0

    /**
     * The  DHCP options correspond to the global scope.
     * Native name: DhcpGlobalOptions
     * @type {Integer (Int32)}
     */
    static GlobalOptions => 1

    /**
     * The  DHCP options correspond to a specific subnet scope.
     * Native name: DhcpSubnetOptions
     * @type {Integer (Int32)}
     */
    static SubnetOptions => 2

    /**
     * The DHCP options correspond to a reserved IP address.
     * Native name: DhcpReservedOptions
     * @type {Integer (Int32)}
     */
    static ReservedOptions => 3

    /**
     * The DHCP options correspond to a multicast scope.
     * @type {Integer (Int32)}
     */
    static DhcpMScopeOptions => 4
}
