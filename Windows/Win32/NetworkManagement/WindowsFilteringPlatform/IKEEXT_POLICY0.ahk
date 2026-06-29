#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_METHOD0.ahk" { IKEEXT_AUTHENTICATION_METHOD0 }
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_PROPOSAL0.ahk" { IKEEXT_PROPOSAL0 }
#Import ".\IKEEXT_POLICY_FLAG.ahk" { IKEEXT_POLICY_FLAG }

/**
 * Is used to store the IKE/AuthIP main mode negotiation policy. (IKEEXT_POLICY0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_policy0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_POLICY0 {
    #StructPack 8

    /**
     * Unused parameter, always set this to 0.
     */
    softExpirationTime : UInt32

    /**
     * Number of authentication methods.
     */
    numAuthenticationMethods : UInt32

    /**
     * Array of acceptable authentication methods.
     * 
     * See  [IKEEXT_AUTHENTICATION_METHOD0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_authentication_method0) for more information.
     */
    authenticationMethods : IKEEXT_AUTHENTICATION_METHOD0.Ptr

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

}
