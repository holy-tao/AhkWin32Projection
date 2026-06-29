#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\OFFLOAD_ALGO_INFO.ahk" { OFFLOAD_ALGO_INFO }
#Import ".\OFFLOAD_SECURITY_ASSOCIATION.ahk" { OFFLOAD_SECURITY_ASSOCIATION }
#Import ".\OFFLOAD_OPERATION_E.ahk" { OFFLOAD_OPERATION_E }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct OFFLOAD_IPSEC_ADD_SA {
    #StructPack 8

    SrcAddr : UInt32

    SrcMask : UInt32

    DestAddr : UInt32

    DestMask : UInt32

    Protocol : UInt32

    SrcPort : UInt16

    DestPort : UInt16

    SrcTunnelAddr : UInt32

    DestTunnelAddr : UInt32

    Flags : UInt16

    NumSAs : Int16

    SecAssoc : OFFLOAD_SECURITY_ASSOCIATION[3]

    OffloadHandle : HANDLE

    KeyLen : UInt32

    KeyMat : Int8[1]

}
