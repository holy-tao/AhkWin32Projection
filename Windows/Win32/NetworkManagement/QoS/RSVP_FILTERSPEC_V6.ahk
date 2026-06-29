#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR_IPV6.ahk" { IN_ADDR_IPV6 }

/**
 * The RSVP_FILTERSPEC_V6 structure stores information for a FILTERSPEC on an IPv6 address.
 * @remarks
 * When working with IPv4 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec_v4">RSVP_FILTERSPEC_V4</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec_v6
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_FILTERSPEC_V6 {
    #StructPack 2

    /**
     * IPv4 address for which the FILTERSPEC applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv6">IN_ADDR_IPV6</a> structure.
     */
    Address : IN_ADDR_IPV6

    UnUsed : UInt16

    /**
     * TCP port of the socket on which the FILTERSPEC applies.
     */
    Port : UInt16

}
