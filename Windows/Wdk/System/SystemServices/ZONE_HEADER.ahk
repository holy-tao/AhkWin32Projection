#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ZONE_HEADER {
    #StructPack 8

    FreeList : IntPtr

    SegmentList : IntPtr

    BlockSize : UInt32

    TotalSegmentSize : UInt32

}
