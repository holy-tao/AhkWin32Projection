#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHCPV6_STATELESS_SCOPE_STATS.ahk" { DHCPV6_STATELESS_SCOPE_STATS }

/**
 * The DHCPV6_STATELESS_STATS structure defines an array of stateless IPv6 subnet statistics.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_stats
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCPV6_STATELESS_STATS {
    #StructPack 8

    /**
     * Integer that specifies the number of subnet statistics in <i>ScopeStats</i>.
     */
    NumScopes : UInt32

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_scope_stats">DHCPV6_STATELESS_SCOPE_STATS</a> structures.
     */
    ScopeStats : DHCPV6_STATELESS_SCOPE_STATS.Ptr

}
