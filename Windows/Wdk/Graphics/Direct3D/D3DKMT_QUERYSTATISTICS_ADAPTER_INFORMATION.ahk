#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_ADAPTER_INFORMATION {
    #StructPack 8

    NbSegments : UInt32

    NodeCount : UInt32

    VidPnSourceCount : UInt32

    VSyncEnabled : UInt32

    TdrDetectedCount : UInt32

    ZeroLengthDmaBuffers : Int64

    RestartedPeriod : Int64

    ReferenceDmaBuffer : IntPtr

    Renaming : IntPtr

    Preparation : IntPtr

    PagingFault : IntPtr

    PagingTransfer : IntPtr

    SwizzlingRange : IntPtr

    Locks : IntPtr

    Allocations : IntPtr

    Terminations : IntPtr

    Flags : IntPtr

    Reserved : Int64[7]

}
