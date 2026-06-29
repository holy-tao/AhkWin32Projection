#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct OFFLOAD_IPSEC_ADD_UDPESP_SA {
    #StructPack 8

    SrcAddr : UInt32

    SrcMask : UInt32

    DstAddr : UInt32

    DstMask : UInt32

    Protocol : UInt32

    SrcPort : UInt16

    DstPort : UInt16

    SrcTunnelAddr : UInt32

    DstTunnelAddr : UInt32

    Flags : UInt16

    NumSAs : Int16

    SecAssoc : IntPtr[3]

    OffloadHandle : HANDLE

    EncapTypeEntry : IntPtr

    EncapTypeEntryOffldHandle : HANDLE

    KeyLen : UInt32

    KeyMat : Int8[1]

}
