#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_PROCESS_NODE_INFORMATION {
    #StructPack 8

    RunningTime : Int64

    ContextSwitch : UInt32

    PreemptionStatistics : IntPtr

    PacketStatistics : IntPtr

    Reserved : Int64[8]

}
