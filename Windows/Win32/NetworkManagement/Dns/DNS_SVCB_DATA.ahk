#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DNS_SVCB_PARAM.ahk" { DNS_SVCB_PARAM }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_SVCB_DATA {
    #StructPack 8

    wSvcPriority : UInt16

    pszTargetName : PSTR

    cSvcParams : UInt16

    pSvcParams : DNS_SVCB_PARAM.Ptr

}
