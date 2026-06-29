#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR_IPV6.ahk" { IN_ADDR_IPV6 }

/**
 * The RSVP_FILTERSPEC_V6_GPI structure provides general port identifier information for a given FILTERSPEC on an IPv6 address.
 * @remarks
 * When working with IPv4 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec_v4_gpi">RSVP_FILTERSPEC_V4_GPI</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec_v6_gpi
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_FILTERSPEC_V6_GPI {
    #StructPack 4

    /**
     * IPv4 address for which the FILTERSPEC general port identifier applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv6">IN_ADDR_IPV6</a> structure.
     */
    Address : IN_ADDR_IPV6

    /**
     * General Port Identifier for the FILTERSPEC.
     */
    GeneralPortId : UInt32

}
