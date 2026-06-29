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
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\FWP_TOKEN_INFORMATION.ahk" { FWP_TOKEN_INFORMATION }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IKEEXT_QM_FAILURE1 {
    #StructPack 8

    failureErrorCode : UInt32

    failurePoint : IPSEC_FAILURE_POINT

    keyingModuleType : IKEEXT_KEY_MODULE_TYPE

    qmState : IKEEXT_QM_SA_STATE

    saRole : IKEEXT_SA_ROLE

    saTrafficType : IPSEC_TRAFFIC_TYPE

    localSubNet : FWP_CONDITION_VALUE0

    remoteSubNet : FWP_CONDITION_VALUE0

    qmFilterId : Int64

    mmSaLuid : Int64

    mmProviderContextKey : Guid

}
