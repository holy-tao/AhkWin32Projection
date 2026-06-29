#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_METHOD1.ahk" { IKEEXT_AUTHENTICATION_METHOD1 }
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_PROPOSAL0.ahk" { IKEEXT_PROPOSAL0 }
#Import ".\IKEEXT_POLICY_FLAG.ahk" { IKEEXT_POLICY_FLAG }

/**
 * Is used to store the IKE/AuthIP main mode negotiation policy. (IKEEXT_POLICY1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_policy1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_POLICY1 {
    #StructPack 8

    /**
     * Lifetime of the IPsec soft SA, in seconds. The caller must set this to 0.
     */
    softExpirationTime : UInt32

    /**
     * Number of authentication methods.
     */
    numAuthenticationMethods : UInt32

    /**
     * Array of acceptable authentication methods.
     * 
     * See  [IKEEXT_AUTHENTICATION_METHOD1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method1) for more information.
     */
    authenticationMethods : IKEEXT_AUTHENTICATION_METHOD1.Ptr

    /**
     * Type of impersonation. Applies only to AuthIP. 
     * 
     * See <a href="https://docs.microsoft.com/windows/win32/api/iketypes/ne-iketypes-ikeext_authentication_impersonation_type">IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE</a> for more information.
     */
    initiatorImpersonationType : IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE

    /**
     * Number of main mode proposals.
     */
    numIkeProposals : UInt32

    /**
     * Array of main mode proposals. 
     * 
     * See [IKEEXT_PROPOSAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_proposal0) for more information.
     */
    ikeProposals : IKEEXT_PROPOSAL0.Ptr

    flags : IKEEXT_POLICY_FLAG

    /**
     * Maximum number of dynamic IPsec filters per remote IP address and per 
     *    transport layer that is allowed to be added for any SA negotiated using 
     *    this policy. 
     * 
     * Set this to 0 to disable dynamic filter addition. Dynamic filters are added by IKE/AuthIP on responder, when the QM traffic proposed by initiator is a subset of responder's traffic configuration.
     */
    maxDynamicFilters : UInt32

    /**
     * The number of seconds for which IKEv2 SA negotiation packets will be retransmitted before the SA times out. The caller must set this to at least 120 seconds.
     */
    retransmitDurationSecs : UInt32

}
