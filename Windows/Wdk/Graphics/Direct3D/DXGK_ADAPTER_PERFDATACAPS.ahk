#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_ADAPTER_PERFDATACAPS {
    #StructPack 8

    MaxMemoryBandwidth : Int64

    MaxPCIEBandwidth : Int64

    MaxFanRPM : UInt32

    TemperatureMax : UInt32

    TemperatureWarning : UInt32

}
