#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCOPE_MIB_INFO_VQ.ahk" { SCOPE_MIB_INFO_VQ }
#Import ".\DATE_TIME.ahk" { DATE_TIME }

/**
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DHCP_MIB_INFO_VQ {
    #StructPack 8

    Discovers : UInt32

    Offers : UInt32

    Requests : UInt32

    Acks : UInt32

    Naks : UInt32

    Declines : UInt32

    Releases : UInt32

    ServerStartTime : DATE_TIME

    QtnNumLeases : UInt32

    QtnPctQtnLeases : UInt32

    QtnProbationLeases : UInt32

    QtnNonQtnLeases : UInt32

    QtnExemptLeases : UInt32

    QtnCapableClients : UInt32

    QtnIASErrors : UInt32

    Scopes : UInt32

    ScopeInfo : SCOPE_MIB_INFO_VQ.Ptr

}
