#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IN_ADDR_IPV6 structure stores an IPv6 address for use with RSVP FILTERSPECs.
 * @remarks
 * When working with IPv4 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv4">IN_ADDR_IPV4</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-in_addr_ipv6
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct IN_ADDR_IPV6 {
    #StructPack 1

    /**
     * IPv6 address.
     */
    Addr : Int8[16]

}
