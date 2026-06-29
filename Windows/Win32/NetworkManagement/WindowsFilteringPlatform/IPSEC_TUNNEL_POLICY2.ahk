#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_POLICY_FLAG.ahk" { IPSEC_POLICY_FLAG }
#Import ".\IPSEC_TUNNEL_ENDPOINT0.ahk" { IPSEC_TUNNEL_ENDPOINT0 }
#Import ".\IKEEXT_EM_POLICY2.ahk" { IKEEXT_EM_POLICY2 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TUNNEL_ENDPOINTS2.ahk" { IPSEC_TUNNEL_ENDPOINTS2 }
#Import ".\IPSEC_SA_IDLE_TIMEOUT0.ahk" { IPSEC_SA_IDLE_TIMEOUT0 }
#Import ".\FWP_IP_VERSION.ahk" { FWP_IP_VERSION }
#Import ".\IPSEC_PROPOSAL0.ahk" { IPSEC_PROPOSAL0 }

/**
 * Stores the quick mode negotiation policy for tunnel mode IPsec. (IPSEC_TUNNEL_POLICY2)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_policy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TUNNEL_POLICY2 {
    #StructPack 8

    /**
     * Type: <b>UINT32</b>
     */
    flags : IPSEC_POLICY_FLAG

    /**
     * Type: <b>UINT32</b>
     * 
     *  Number of quick mode proposals in the policy.
     */
    numIpsecProposals : UInt32

    /**
     * Type: [IPSEC_PROPOSAL0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_proposal0)*</b>
     * 
     * Array of quick mode proposals.
     */
    ipsecProposals : IPSEC_PROPOSAL0.Ptr

    /**
     * Type: [IPSEC_TUNNEL_ENDPOINTS2](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_tunnel_endpoints2)</b>
     * 
     * Tunnel endpoints of the IPsec security association (SA) generated from this policy.
     */
    tunnelEndpoints : IPSEC_TUNNEL_ENDPOINTS2

    /**
     * Type: [IPSEC_SA_IDLE_TIMEOUT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0)</b>
     * 
     * Specifies the SA idle timeout in IPsec policy.
     */
    saIdleTimeout : IPSEC_SA_IDLE_TIMEOUT0

    /**
     * Type: [IKEEXT_EM_POLICY2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_em_policy2)*</b>
     * 
     * The AuthIP extended mode authentication policy.
     */
    emPolicy : IKEEXT_EM_POLICY2.Ptr

    /**
     * Type: <b>UINT32</b>
     * 
     * The forward path SA lifetime indicating the length of time for this connection.
     */
    fwdPathSaLifetime : UInt32

}
