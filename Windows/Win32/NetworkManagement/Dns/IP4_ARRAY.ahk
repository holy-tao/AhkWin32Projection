#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IP4_ARRAY structure stores an array of IPv4 addresses.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-ip4_array
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct IP4_ARRAY {
    #StructPack 4

    /**
     * The number of IPv4 addresses in <b>AddrArray</b>.
     */
    AddrCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/DNS/dns-data-types">IP4_ADDRESS</a> data types that contains a list of IPv4 address.
     */
    AddrArray : UInt32[1]

}
