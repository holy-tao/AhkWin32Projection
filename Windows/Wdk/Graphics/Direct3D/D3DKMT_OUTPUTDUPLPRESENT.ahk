#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTPUTDUPLPRESENT {
    #StructPack 8

    hContext : UInt32

    hSource : UInt32

    VidPnSourceId : UInt32

    BroadcastContextCount : UInt32

    BroadcastContext : UInt32[64]

    PresentRegions : IntPtr

    Flags : IntPtr

    hIndirectContext : UInt32

}
