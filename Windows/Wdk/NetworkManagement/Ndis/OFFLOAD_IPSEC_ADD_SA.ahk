#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
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

    SecAssoc : IntPtr[3]

    OffloadHandle : HANDLE

    KeyLen : UInt32

    KeyMat : Int8[1]

}
