#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import ".\DEVICE_POWER_STATE.ahk" { DEVICE_POWER_STATE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct CM_POWER_DATA {
    #StructPack 4

    PD_Size : UInt32

    PD_MostRecentPowerState : DEVICE_POWER_STATE

    PD_Capabilities : UInt32

    PD_D1Latency : UInt32

    PD_D2Latency : UInt32

    PD_D3Latency : UInt32

    PD_PowerStateMapping : DEVICE_POWER_STATE[7]

    PD_DeepestSystemWake : SYSTEM_POWER_STATE

}
