#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DHCPV6_STATELESS_STATS structure defines an array of stateless IPv6 subnet statistics.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_stats
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6_STATELESS_STATS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Integer that specifies the number of subnet statistics in <i>ScopeStats</i>.
     * @type {Integer}
     */
    NumScopes {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_scope_stats">DHCPV6_STATELESS_SCOPE_STATS</a> structures.
     * @type {Pointer<DHCPV6_STATELESS_SCOPE_STATS>}
     */
    ScopeStats {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
