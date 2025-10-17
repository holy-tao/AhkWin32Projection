#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk

/**
 * Specifies a range of IPv6 addresses for use with a DHCPv6 server.
 * @see https://docs.microsoft.com/windows/win32/api//dhcpsapi/ns-dhcpsapi-dhcp_ip_range_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_IP_RANGE_V6 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the first IPv6 address in the range.
     * @type {DHCP_IPV6_ADDRESS}
     */
    StartAddress{
        get {
            if(!this.HasProp("__StartAddress"))
                this.__StartAddress := DHCP_IPV6_ADDRESS(0, this)
            return this.__StartAddress
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the last IPv6 address in the range.
     * @type {DHCP_IPV6_ADDRESS}
     */
    EndAddress{
        get {
            if(!this.HasProp("__EndAddress"))
                this.__EndAddress := DHCP_IPV6_ADDRESS(16, this)
            return this.__EndAddress
        }
    }
}
