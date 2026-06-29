#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_POLICY_FLAG.ahk" { IPSEC_POLICY_FLAG }
#Import ".\IPSEC_SA_IDLE_TIMEOUT0.ahk" { IPSEC_SA_IDLE_TIMEOUT0 }
#Import ".\IPSEC_PROPOSAL0.ahk" { IPSEC_PROPOSAL0 }
#Import ".\IKEEXT_EM_POLICY2.ahk" { IKEEXT_EM_POLICY2 }

/**
 * Stores the quick mode negotiation policy for transport mode IPsec. (IPSEC_TRANSPORT_POLICY2)
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_transport_policy2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_TRANSPORT_POLICY2 {
    #StructPack 8

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
     * Type: <b>UINT32</b>
     */
    flags : IPSEC_POLICY_FLAG

    /**
     * Type: <b>UINT32</b>
     * 
     * Timeout in seconds, after which the IPsec security association (SA) should stop accepting
     *    packets coming in the clear. Used for negotiation discovery.
     */
    ndAllowClearTimeoutSeconds : UInt32

    /**
     * Type: [IPSEC_SA_IDLE_TIMEOUT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_idle_timeout0)</b>
     * 
     * The SA idle timeout in IPsec policy.
     */
    saIdleTimeout : IPSEC_SA_IDLE_TIMEOUT0

    /**
     * Type: [IKEEXT_EM_POLICY2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_em_policy2)*</b>
     * 
     * The AuthIP extended mode authentication policy.
     */
    emPolicy : IKEEXT_EM_POLICY2.Ptr

}
