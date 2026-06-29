#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_VIDPNSOURCE_INFORMATION {
    #StructPack 8

    Frame : UInt32

    CancelledFrame : UInt32

    QueuedPresent : UInt32

    Padding : UInt32

    IsVSyncEnabled : Int64

    VSyncOnTotalTimeMs : Int64

    VSyncOffKeepPhaseTotalTimeMs : Int64

    VSyncOffNoPhaseTotalTimeMs : Int64

    Reserved : Int64[4]

}
