#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DHCP_IPV6_ADDRESS structure contains an IPv6 address.
 * @remarks
 * An alternate name for this structure is <b>DHCP_RESUME_IPV6_HANDLE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 * @version v4.0.30319
 */
class DHCP_IPV6_ADDRESS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <b>ULONGULONG</b> value containing the higher 64 bits of the IPv6 address.
     * @type {Integer}
     */
    HighOrderBits {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <b>ULONGULONG</b> value containing the lower 64 bits of the IPv6 address.
     * @type {Integer}
     */
    LowOrderBits {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
