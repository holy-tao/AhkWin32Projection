#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_ADAPTER_POWER_STATES.ahk" { POWER_ADAPTER_POWER_STATES }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_ADAPTER_STATUS {
    #StructPack 8

    Version : Int8

    Reserved : Int8[3]

    PowerState : POWER_ADAPTER_POWER_STATES

    PeakPower : UInt32

    MaxOutputPower : UInt32

    MaxInputPower : UInt32

    RecStartTime : Int64

    RecEndTime : Int64

}
