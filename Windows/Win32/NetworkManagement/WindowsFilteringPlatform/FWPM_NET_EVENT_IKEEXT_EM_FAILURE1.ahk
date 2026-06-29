#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_FAILURE_POINT.ahk" { IPSEC_FAILURE_POINT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_SA_ROLE.ahk" { IKEEXT_SA_ROLE }
#Import ".\IKEEXT_EM_SA_STATE.ahk" { IKEEXT_EM_SA_STATE }

/**
 * The FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 structure contains information that describes an IKE Extended mode (EM) failure.Note  FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 is the specific implementation of FWPM_NET_EVENT_IKEEXT_EM_FAILURE used in Windows 7 and later.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_em_failure1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IKEEXT_EM_FAILURE1 {
    #StructPack 8

    /**
     * Windows error code for the failure.
     */
    failureErrorCode : UInt32

    /**
     * An [IPSEC_FAILURE_POINT](../ipsectypes/ne-ipsectypes-ipsec_failure_point.md) value that indicates the IPsec state when the failure occurred.
     */
    failurePoint : IPSEC_FAILURE_POINT

    /**
     * Flags for the failure event.
     * 
     * | Value | Meaning |
     * | ----- | ------- |
     * | FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_MULTIPLE | Indicates that multiple IKE EM failure events have been reported. |
     * | FWPM_NET_EVENT_IKEEXT_EM_FAILURE_FLAG_BENIGN | Indicates that IKE EM failure events have been reported, but that the events are benign. |
     */
    flags : UInt32

    /**
     * An [IKEEXT_EM_SA_STATE](../iketypes/ne-iketypes-ikeext_em_sa_state.md) value that indicates the EM state when the failure occurred.
     */
    emState : IKEEXT_EM_SA_STATE

    /**
     * An [IKEEXT_SA_ROLE](../iketypes/ne-iketypes-ikeext_sa_role.md) value that specifies the SA role when the failure occurred.
     */
    saRole : IKEEXT_SA_ROLE

    /**
     * An [IKEEXT_AUTHENTICATION_METHOD_TYPE](../iketypes/ne-iketypes-ikeext_authentication_method_type.md) value that specifies the authentication method.
     */
    emAuthMethod : IKEEXT_AUTHENTICATION_METHOD_TYPE

    /**
     * SHA thumbprint hash of the end certificate corresponding to the failures that happen during building or validating certificate chains.
     * 
     * **IKEEXT_CERT_HASH_LEN** maps to 20.
     */
    endCertHash : Int8[20]

    /**
     * LUID for the Main Mode (MM) SA.
     */
    mmId : Int64

    /**
     * Quick Mode (QM) filter ID associated with this failure.
     */
    qmFilterId : Int64

    /**
     * Name of the EM local security principal.
     */
    localPrincipalNameForAuth : PWSTR

    /**
     * Name of the EM remote security principal.
     */
    remotePrincipalNameForAuth : PWSTR

    /**
     * Number of groups in the local security principal's token.
     */
    numLocalPrincipalGroupSids : UInt32

    /**
     * Groups in the local security principal's token.
     */
    localPrincipalGroupSids : PWSTR.Ptr

    /**
     * Number of groups in the remote security principal's token.
     */
    numRemotePrincipalGroupSids : UInt32

    /**
     * Groups in the remote security principal's token.
     */
    remotePrincipalGroupSids : PWSTR.Ptr

    /**
     * Type of traffic for which the embedded quick mode was being negotiated.
     */
    saTrafficType : IPSEC_TRAFFIC_TYPE

}
