#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR_IPV6.ahk" { IN_ADDR_IPV6 }

/**
 * The RSVP_FILTERSPEC_V6_FLOW structure provides flow label information for an IPv6 FILTERSPEC.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec_v6_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_FILTERSPEC_V6_FLOW {
    #StructPack 1

    /**
     * IPv4 address for which the FILTERSPEC flow label applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv6">IN_ADDR_IPV6</a> structure.
     */
    Address : IN_ADDR_IPV6

    UnUsed : Int8

    /**
     * Label for the flow.
     */
    FlowLabel : Int8[3]

}
