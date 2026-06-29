#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Power\SYSTEM_BATTERY_STATE.ahk" { SYSTEM_BATTERY_STATE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct SYSTEM_POWER_SOURCE_STATE {
    #StructPack 4

    BatteryState : SYSTEM_BATTERY_STATE

    InstantaneousPeakPower : UInt32

    InstantaneousPeakPeriod : UInt32

    SustainablePeakPower : UInt32

    SustainablePeakPeriod : UInt32

    PeakPower : UInt32

    MaxOutputPower : UInt32

    MaxInputPower : UInt32

    BatteryRateInCurrent : Int32

    BatteryVoltage : UInt32

}
