#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an IPv6 address.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-ipv6address
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct Ipv6Address {
    #StructPack 1

    /**
     * An array that contains an IPv6 network address in network byte order.
     */
    addr : Int8[16]

}
