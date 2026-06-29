#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IPSEC_FAILURE_POINT.ahk" { IPSEC_FAILURE_POINT }
#Import ".\IKEEXT_MM_SA_STATE.ahk" { IKEEXT_MM_SA_STATE }
#Import ".\IKEEXT_KEY_MODULE_TYPE.ahk" { IKEEXT_KEY_MODULE_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKEEXT_SA_ROLE.ahk" { IKEEXT_SA_ROLE }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWPM_NET_EVENT_IKEEXT_MM_FAILURE2 {
    #StructPack 8

    failureErrorCode : UInt32

    failurePoint : IPSEC_FAILURE_POINT

    flags : UInt32

    keyingModuleType : IKEEXT_KEY_MODULE_TYPE

    mmState : IKEEXT_MM_SA_STATE

    saRole : IKEEXT_SA_ROLE

    mmAuthMethod : IKEEXT_AUTHENTICATION_METHOD_TYPE

    endCertHash : Int8[20]

    mmId : Int64

    mmFilterId : Int64

    localPrincipalNameForAuth : PWSTR

    remotePrincipalNameForAuth : PWSTR

    numLocalPrincipalGroupSids : UInt32

    localPrincipalGroupSids : PWSTR.Ptr

    numRemotePrincipalGroupSids : UInt32

    remotePrincipalGroupSids : PWSTR.Ptr

    providerContextKey : Guid.Ptr

}
