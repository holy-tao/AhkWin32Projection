#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\SID.ahk" { SID }
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\FWP_RANGE0.ahk" { FWP_RANGE0 }
#Import ".\FWP_BYTE_ARRAY6.ahk" { FWP_BYTE_ARRAY6 }
#Import ".\IKEEXT_KEY_MODULE_TYPE.ahk" { IKEEXT_KEY_MODULE_TYPE }
#Import ".\FWP_V4_ADDR_AND_MASK.ahk" { FWP_V4_ADDR_AND_MASK }
#Import ".\FWP_V6_ADDR_AND_MASK.ahk" { FWP_V6_ADDR_AND_MASK }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FWP_DATA_TYPE.ahk" { FWP_DATA_TYPE }
#Import ".\FWP_CONDITION_VALUE0.ahk" { FWP_CONDITION_VALUE0 }
#Import ".\IPSEC_FAILURE_POINT.ahk" { IPSEC_FAILURE_POINT }
#Import ".\IKEEXT_QM_SA_STATE.ahk" { IKEEXT_QM_SA_STATE }
#Import ".\IKEEXT_SA_ROLE.ahk" { IKEEXT_SA_ROLE }
#Import ".\FWP_BYTE_ARRAY16.ahk" { FWP_BYTE_ARRAY16 }
#Import ".\IPSEC_TRAFFIC_TYPE.ahk" { IPSEC_TRAFFIC_TYPE }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }

/**
 * Contains information that describes an IKE/AuthIP Quick Mode (QM) failure.
 * @remarks
 * <b>FWPM_NET_EVENT_IKEEXT_QM_FAILURE0</b> is a specific implementation of FWPM_NET_EVENT_IKEEXT_QM_FAILURE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_ikeext_qm_failure0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IKEEXT_QM_FAILURE0 {
    #StructPack 8

    /**
     * Windows error code for the failure.
     */
    failureErrorCode : UInt32

    /**
     * An [IPSEC_FAILURE_POINT](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_failure_point) value that indicates the IPsec state when the failure occurred.
     */
    failurePoint : IPSEC_FAILURE_POINT

    /**
     * An [IKEEXT_KEY_MODULE_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_key_module_type) value that specifies the type of keying module.
     */
    keyingModuleType : IKEEXT_KEY_MODULE_TYPE

    /**
     * An [IKEEXT_QM_SA_STATE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_qm_sa_state) value that specifies the QM state when the failure occurred.
     */
    qmState : IKEEXT_QM_SA_STATE

    /**
     * An [IKEEXT_SA_ROLE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_sa_role) value that specifies the SA role when the failure occurred.
     */
    saRole : IKEEXT_SA_ROLE

    /**
     * An [IPSEC_TRAFFIC_TYPE](/windows/desktop/api/ipsectypes/ne-ipsectypes-ipsec_traffic_type) value that specifies the type of traffic.
     */
    saTrafficType : IPSEC_TRAFFIC_TYPE

    localSubNet : FWP_CONDITION_VALUE0

    remoteSubNet : FWP_CONDITION_VALUE0

    /**
     * Quick Mode filter ID.
     */
    qmFilterId : Int64

}
