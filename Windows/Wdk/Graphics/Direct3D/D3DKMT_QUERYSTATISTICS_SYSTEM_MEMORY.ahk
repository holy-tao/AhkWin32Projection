#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_SYSTEM_MEMORY {
    #StructPack 8

    BytesAllocated : Int64

    BytesReserved : Int64

    SmallAllocationBlocks : UInt32

    LargeAllocationBlocks : UInt32

    WriteCombinedBytesAllocated : Int64

    WriteCombinedBytesReserved : Int64

    CachedBytesAllocated : Int64

    CachedBytesReserved : Int64

    SectionBytesAllocated : Int64

    SectionBytesReserved : Int64

    BytesZeroed : Int64

}
