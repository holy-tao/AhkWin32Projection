#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR_IPV4.ahk" { IN_ADDR_IPV4 }

/**
 * The RSVP_FILTERSPEC_V4 structure stores information for a FILTERSPEC on an IPv4 address.
 * @remarks
 * When working with IPv6 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec_v6">RSVP_FILTERSPEC_V6</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec_v4
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_FILTERSPEC_V4 {
    #StructPack 4

    /**
     * IPv4 address for which the FILTERSPEC applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv4">IN_ADDR_IPV4</a> union.
     */
    Address : IN_ADDR_IPV4

    /**
     * Reserved. Set to zero.
     */
    Unused : UInt16

    /**
     * TCP port of the socket on which the FILTERSPEC applies.
     */
    Port : UInt16

}
