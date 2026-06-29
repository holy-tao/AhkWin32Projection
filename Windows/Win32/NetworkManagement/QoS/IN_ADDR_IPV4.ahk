#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IN_ADDR_IPV4 union stores an IPv4 address for use with RSVP FILTERSPECs.
 * @remarks
 * When working with IPv6 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv6">IN_ADDR_IPV6</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-in_addr_ipv4
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct IN_ADDR_IPV4 {
    #StructPack 4

    /**
     * IPv4 address, expressed as a ULONG.
     */
    Addr : UInt32

    static __New() {
        DefineProp(this.Prototype, 'AddrBytes', { type: Int8[4], offset: 0 })
        this.DeleteProp("__New")
    }
}
