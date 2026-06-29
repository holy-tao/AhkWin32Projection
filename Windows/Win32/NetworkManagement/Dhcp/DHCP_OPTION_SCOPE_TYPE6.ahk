#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the set of possible scopes for DHCP options.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ne-dhcpsapi-dhcp_option_scope_type6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_OPTION_SCOPE_TYPE6 {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static DhcpGlobalOptions6 => 3
}
