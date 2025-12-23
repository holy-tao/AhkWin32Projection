#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DHCP_IPV6_ADDRESS.ahk

/**
 * Defines an IPv6 reservation for a DHCPv6 client in a specific IPv6 prefix.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ip_reservation_v6
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_IP_RESERVATION_V6 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address">DHCP_IPV6_ADDRESS</a> structure that contains the IPv6 address of the DHCPv6 client for which an IPv6 reservation is created.
     * @type {DHCP_IPV6_ADDRESS}
     */
    ReservedIpAddress{
        get {
            if(!this.HasProp("__ReservedIpAddress"))
                this.__ReservedIpAddress := DHCP_IPV6_ADDRESS(0, this)
            return this.__ReservedIpAddress
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dhcpsapi/ns-dhcpsapi-dhcp_binary_data">DHCP_CLIENT_UID</a> structure that contains the hardware address (MAC address) of the DHCPv6 client for which the IPv6 reservation is created.
     * @type {Pointer<DHCP_BINARY_DATA>}
     */
    ReservedForClient {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Integer that specifies the interface identifier for which the IPv6 reservation is created.
     * @type {Integer}
     */
    InterfaceId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
