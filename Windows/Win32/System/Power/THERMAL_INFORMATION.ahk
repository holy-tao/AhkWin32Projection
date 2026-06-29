#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct THERMAL_INFORMATION {
    #StructPack 8

    ThermalStamp : UInt32

    ThermalConstant1 : UInt32

    ThermalConstant2 : UInt32

    Processors : IntPtr

    SamplingPeriod : UInt32

    CurrentTemperature : UInt32

    PassiveTripPoint : UInt32

    CriticalTripPoint : UInt32

    ActiveTripPointCount : Int8

    ActiveTripPoint : UInt32[10]

}
