#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_VIDEO_MEMORY {
    #StructPack 8

    AllocsCommitted : UInt32

    AllocsResidentInP : IntPtr[5]

    AllocsResidentInNonPreferred : IntPtr

    TotalBytesEvictedDueToPreparation : Int64

}
