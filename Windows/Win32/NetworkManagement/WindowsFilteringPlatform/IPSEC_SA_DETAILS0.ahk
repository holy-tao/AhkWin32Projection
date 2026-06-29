#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_DIRECTION.ahk" { FWP_DIRECTION }
#Import ".\IPSEC_SA_LIFETIME0.ahk" { IPSEC_SA_LIFETIME0 }
#Import ".\IPSEC_KEYMODULE_STATE0.ahk" { IPSEC_KEYMODULE_STATE0 }
#Import ".\IPSEC_SA_BUNDLE_FLAGS.ahk" { IPSEC_SA_BUNDLE_FLAGS }
#Import ".\IPSEC_V4_UDP_ENCAPSULATION0.ahk" { IPSEC_V4_UDP_ENCAPSULATION0 }
#Import ".\IPSEC_PFS_GROUP.ahk" { IPSEC_PFS_GROUP }
#Import ".\FWPM_FILTER0.ahk" { FWPM_FILTER0 }
#Import ".\IPSEC_ID0.ahk" { IPSEC_ID0 }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import ".\IPSEC_TRAFFIC0.ahk" { IPSEC_TRAFFIC0 }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IPSEC_SA0.ahk" { IPSEC_SA0 }
#Import ".\IPSEC_SA_BUNDLE0.ahk" { IPSEC_SA_BUNDLE0 }

/**
 * Is used to store information returned when enumerating IPsec security associations (SAs). (IPSEC_SA_DETAILS0)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_DETAILS0 {
    #StructPack 8

    /**
     * Internet Protocol (IP) version as specified by [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version).
     */
    ipVersion : FWP_IP_VERSION

    /**
     * Indicates direction of the IPsec SA as specified by [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction).
     */
    saDirection : FWP_DIRECTION

    /**
     * The traffic being secured by this IPsec SA as specified by [IPSEC_TRAFFIC0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0).
     */
    traffic : IPSEC_TRAFFIC0

    /**
     * Various parameters of the SA as specified by [IPSEC_SA_BUNDLE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle0).
     */
    saBundle : IPSEC_SA_BUNDLE0

    udpEncapsulation : IPSEC_V4_UDP_ENCAPSULATION0.Ptr

    /**
     * The transport layer filter corresponding to this IPsec SA as specified by [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0).
     */
    transportFilter : FWPM_FILTER0.Ptr

}
