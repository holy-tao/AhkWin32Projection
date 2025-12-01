#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk

/**
 * The DHCPV6_STATELESS_SCOPE_STATS structure defines the address counters for a specific IPv6 stateless subnet. The number of stateless IPv6 clients added and removed from the stateless client inventory are stored in this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcpv6_stateless_scope_stats
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCPV6_STATELESS_SCOPE_STATS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that specifies the IPv6 prefix of the DHCPv6 stateless scope.
     * @type {DHCP_IPV6_ADDRESS}
     */
    SubnetAddress{
        get {
            if(!this.HasProp("__SubnetAddress"))
                this.__SubnetAddress := DHCP_IPV6_ADDRESS(0, this)
            return this.__SubnetAddress
        }
    }

    /**
     * Integer that specifies the number of IPv6 stateless clients that have been added to the DHCPv6 stateless client inventory for the prefix in <b>SubnetAddress</b>.
     * @type {Integer}
     */
    NumStatelessClientsAdded {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Integer that specifies the number of IPv6 stateless clients that have been removed from the DHCPv6 stateless client inventory for the prefix in <b>SubnetAddress</b>.
     * @type {Integer}
     */
    NumStatelessClientsRemoved {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
