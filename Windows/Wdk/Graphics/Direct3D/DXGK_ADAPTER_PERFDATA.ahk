#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_ADAPTER_PERFDATA {
    #StructPack 8

    MemoryFrequency : Int64

    MaxMemoryFrequency : Int64

    MaxMemoryFrequencyOC : Int64

    MemoryBandwidth : Int64

    PCIEBandwidth : Int64

    FanRPM : UInt32

    Power : UInt32

    Temperature : UInt32

    PowerStateOverride : Int8

}
