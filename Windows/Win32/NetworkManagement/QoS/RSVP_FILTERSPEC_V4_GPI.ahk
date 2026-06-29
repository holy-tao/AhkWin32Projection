#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IN_ADDR_IPV4.ahk" { IN_ADDR_IPV4 }

/**
 * The RSVP_FILTERSPEC_V4_GPI structure provides general port identifier information for a given FILTERSPEC.
 * @remarks
 * When working with IPv6 addresses, use <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-rsvp_filterspec_v6_gpi">RSVP_FILTERSPEC_V6_GPI</a>.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-rsvp_filterspec_v4_gpi
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct RSVP_FILTERSPEC_V4_GPI {
    #StructPack 4

    /**
     * IPv4 address for which the FILTERSPEC general port identifier applies, expressed as an <a href="https://docs.microsoft.com/windows/desktop/api/qossp/ns-qossp-in_addr_ipv4">IN_ADDR_IPV4</a> union.
     */
    Address : IN_ADDR_IPV4

    /**
     * General Port Identifier for the FILTERSPEC.
     */
    GeneralPortId : UInt32

}
