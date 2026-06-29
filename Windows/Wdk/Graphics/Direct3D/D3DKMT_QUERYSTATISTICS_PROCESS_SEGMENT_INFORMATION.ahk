#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_SEGMENT_INFORMATION {
    #StructPack 8

    BytesCommitted : Int64

    MaximumWorkingSet : Int64

    MinimumWorkingSet : Int64

    NbReferencedAllocationEvictedInPeriod : UInt32

    Padding : UInt32

    VideoMemory : IntPtr

    _Policy : IntPtr

    Reserved : Int64[8]

}
