#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ZONE_SEGMENT_HEADER {
    #StructPack 8

    SegmentList : IntPtr

    Reserved : IntPtr

}
