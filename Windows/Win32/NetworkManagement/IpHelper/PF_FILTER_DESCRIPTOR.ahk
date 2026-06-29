#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFADDRESSTYPE.ahk" { PFADDRESSTYPE }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct PF_FILTER_DESCRIPTOR {
    #StructPack 8

    dwFilterFlags : UInt32

    dwRule : UInt32

    pfatType : PFADDRESSTYPE

    SrcAddr : IntPtr

    SrcMask : IntPtr

    DstAddr : IntPtr

    DstMask : IntPtr

    dwProtocol : UInt32

    fLateBound : UInt32

    wSrcPort : UInt16

    wDstPort : UInt16

    wSrcPortHighRange : UInt16

    wDstPortHighRange : UInt16

}
