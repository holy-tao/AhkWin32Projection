#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_FAILURE_POINT.ahk" { IPSEC_FAILURE_POINT }
#Import ".\IKEEXT_MM_SA_STATE.ahk" { IKEEXT_MM_SA_STATE }
#Import ".\IKEEXT_KEY_MODULE_TYPE.ahk" { IKEEXT_KEY_MODULE_TYPE }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_SA_ROLE.ahk" { IKEEXT_SA_ROLE }

/**
 * Contains information that describes an IKE/AuthIP Main Mode (MM) failure. (FWPM_NET_EVENT_IKEEXT_MM_FAILURE0)
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_mm_failure0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IKEEXT_MM_FAILURE0 {
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
     * | FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_BENIGN | Indicates that the failure was benign or expected. |
     * | FWPM_NET_EVENT_IKEEXT_MM_FAILURE_FLAG_MULTIPLE | Indicates that multiple failure events have been reported. |
     */
    flags : UInt32

    /**
     * An [IKEEXT_KEY_MODULE_TYPE](../iketypes/ne-iketypes-ikeext_key_module_type.md) value that specifies the type of keying module.
     */
    keyingModuleType : IKEEXT_KEY_MODULE_TYPE

    /**
     * An [IKEEXT_MM_SA_STATE](../iketypes/ne-iketypes-ikeext_mm_sa_state.md) value that indicates the Main Mode state when the failure occurred.
     */
    mmState : IKEEXT_MM_SA_STATE

    /**
     * An [IKEEXT_SA_ROLE](../iketypes/ne-iketypes-ikeext_sa_role.md) value that specifies the security association (SA) role when the failure occurred.
     */
    saRole : IKEEXT_SA_ROLE

    /**
     * An [IKEEXT_AUTHENTICATION_METHOD_TYPE](../iketypes/ne-iketypes-ikeext_authentication_method_type.md) value that specifies the authentication method.
     */
    mmAuthMethod : IKEEXT_AUTHENTICATION_METHOD_TYPE

    /**
     * SHA thumbprint hash of the end certificate corresponding to the failures that happen during building or validating certificate chains.
     * 
     * **IKEEXT_CERT_HASH_LEN** maps to 20.
     */
    endCertHash : Int8[20]

    /**
     * LUID for the MM SA.
     */
    mmId : Int64

    /**
     * Main mode filter ID.
     */
    mmFilterId : Int64

}
