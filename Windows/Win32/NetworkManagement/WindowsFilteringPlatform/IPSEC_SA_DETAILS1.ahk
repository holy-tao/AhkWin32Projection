#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_V4_UDP_ENCAPSULATION0.ahk" { IPSEC_V4_UDP_ENCAPSULATION0 }
#Import ".\IPSEC_SA0.ahk" { IPSEC_SA0 }
#Import ".\IPSEC_VIRTUAL_IF_TUNNEL_INFO0.ahk" { IPSEC_VIRTUAL_IF_TUNNEL_INFO0 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IPSEC_SA_LIFETIME0.ahk" { IPSEC_SA_LIFETIME0 }
#Import ".\FWPM_FILTER0.ahk" { FWPM_FILTER0 }
#Import ".\IPSEC_TRAFFIC1.ahk" { IPSEC_TRAFFIC1 }
#Import ".\IPSEC_ID0.ahk" { IPSEC_ID0 }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import ".\IPSEC_PFS_GROUP.ahk" { IPSEC_PFS_GROUP }
#Import ".\FWP_DIRECTION.ahk" { FWP_DIRECTION }
#Import ".\IPSEC_KEYMODULE_STATE0.ahk" { IPSEC_KEYMODULE_STATE0 }
#Import ".\IPSEC_SA_BUNDLE_FLAGS.ahk" { IPSEC_SA_BUNDLE_FLAGS }
#Import ".\IPSEC_SA_BUNDLE1.ahk" { IPSEC_SA_BUNDLE1 }

/**
 * Is used to store information returned when enumerating IPsec security associations (SAs). (IPSEC_SA_DETAILS1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_DETAILS1 {
    #StructPack 8

    /**
     * An [FWP_IP_VERSION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_ip_version) value that specifies the IP version. In tunnel mode, this is the version of the outer header.
     */
    ipVersion : FWP_IP_VERSION

    /**
     * An [FWP_DIRECTION](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_direction) value that indicates the direction of the IPsec SA.
     */
    saDirection : FWP_DIRECTION

    /**
     * An [IPSEC_TRAFFIC1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic1) structure that specifies the traffic being secured by this IPsec SA. In tunnel mode, this contains both the tunnel endpoints and Quick Mode (QM)  traffic selectors.
     */
    traffic : IPSEC_TRAFFIC1

    /**
     * An [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure that specifies various parameters of the SA .
     */
    saBundle : IPSEC_SA_BUNDLE1

    udpEncapsulation : IPSEC_V4_UDP_ENCAPSULATION0.Ptr

    /**
     * An [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0) structure that specifies the transport layer filter that corresponds to this IPsec SA.
     */
    transportFilter : FWPM_FILTER0.Ptr

    /**
     * An [IPSEC_VIRTUAL_IF_TUNNEL_INFO0](/windows/desktop/api/fwptypes/ns-fwptypes-ipsec_virtual_if_tunnel_info0) structure that specifies the virtual interface tunnel information. Only supported by Internet Key Exchange version 2 (IKEv2).
     */
    virtualIfTunnelInfo : IPSEC_VIRTUAL_IF_TUNNEL_INFO0

}
