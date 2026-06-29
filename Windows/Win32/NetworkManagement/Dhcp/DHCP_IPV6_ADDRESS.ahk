#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * DHCP_IPV6_ADDRESS structure contains an IPv6 address.
 * @remarks
 * An alternate name for this structure is <b>DHCP_RESUME_IPV6_HANDLE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-dhcp_ipv6_address
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_IPV6_ADDRESS {
    #StructPack 8

    /**
     * A <b>ULONGULONG</b> value containing the higher 64 bits of the IPv6 address.
     */
    HighOrderBits : Int64

    /**
     * A <b>ULONGULONG</b> value containing the lower 64 bits of the IPv6 address.
     */
    LowOrderBits : Int64

}
