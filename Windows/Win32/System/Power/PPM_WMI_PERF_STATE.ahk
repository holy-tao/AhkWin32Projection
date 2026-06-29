#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_WMI_PERF_STATE {
    #StructPack 8

    Frequency : UInt32

    Power : UInt32

    PercentFrequency : Int8

    IncreaseLevel : Int8

    DecreaseLevel : Int8

    Type : Int8

    IncreaseTime : UInt32

    DecreaseTime : UInt32

    Control : Int64

    Status : Int64

    HitCount : UInt32

    Reserved1 : UInt32

    Reserved2 : Int64

    Reserved3 : Int64

}
