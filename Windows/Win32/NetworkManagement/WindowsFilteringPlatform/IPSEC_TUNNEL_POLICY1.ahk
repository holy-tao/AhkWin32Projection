#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_POLICY_FLAG.ahk" { IPSEC_POLICY_FLAG }
#Import ".\IPSEC_SA_IDLE_TIMEOUT0.ahk" { IPSEC_SA_IDLE_TIMEOUT0 }
#Import ".\IKEEXT_EM_POLICY1.ahk" { IKEEXT_EM_POLICY1 }
#Import ".\IPSEC_PROPOSAL0.ahk" { IPSEC_PROPOSAL0 }
#Import ".\IPSEC_TUNNEL_ENDPOINTS1.ahk" { IPSEC_TUNNEL_ENDPOINTS1 }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }

/**
 * Stores the quick mode negotiation policy for tunnel mode IPsec. (IPSEC_TUNNEL_POLICY1)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_POLICY1 {
    #StructPack 8

    flags : IPSEC_POLICY_FLAG

    /**
     * Number of quick mode proposals in the policy.
     */
    numIpsecProposals : UInt32

    /**
     * Array of quick mode proposals.
     * 
     * See [IPSEC_PROPOSAL0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_proposal0) for more information.
     */
    ipsecProposals : IPSEC_PROPOSAL0.Ptr

    /**
     * Tunnel endpoints of the IPsec security association (SA) generated from this policy.
     * 
     * See [IPSEC_TUNNEL_ENDPOINTS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints1) for more information.
     */
    tunnelEndpoints : IPSEC_TUNNEL_ENDPOINTS1

    /**
     * An [IPSEC_SA_IDLE_TIMEOUT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0) structure that specifies the SA idle timeout in IPsec policy.
     */
    saIdleTimeout : IPSEC_SA_IDLE_TIMEOUT0

    /**
     * The AuthIP extended mode authentication policy.
     * 
     * See [IKEEXT_EM_POLICY1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_em_policy1) for more information.
     */
    emPolicy : IKEEXT_EM_POLICY1.Ptr

}
