#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_NODE_PERFDATA {
    #StructPack 8

    Frequency : Int64

    MaxFrequency : Int64

    MaxFrequencyOC : Int64

    Voltage : UInt32

    VoltageMax : UInt32

    VoltageMaxOC : UInt32

    MaxTransitionLatency : Int64

}
