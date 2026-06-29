#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines an IPv4 address.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-ipv4address
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct Ipv4Address {
    #StructPack 1

    /**
     * An array that contains an IPv4 network address in network byte order.
     */
    addr : Int8[4]

}
