#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible scopes for DHCP options.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_OPTION_SCOPE_TYPE6 extends Win32Enum{

    /**
     * The default set of DHCP options are selected.
     * @type {Integer (Int32)}
     */
    static DhcpDefaultOptions6 => 0

    /**
     * Only DHCP options defined for this scope are selected.
     * @type {Integer (Int32)}
     */
    static DhcpScopeOptions6 => 1

    /**
     * Only the reserved set of DHCP options are selected.
     * @type {Integer (Int32)}
     */
    static DhcpReservedOptions6 => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static DhcpGlobalOptions6 => 3
}
