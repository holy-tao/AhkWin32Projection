#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\ACPI_TIME_RESOLUTION.ahk" { ACPI_TIME_RESOLUTION }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct ACPI_TIME_AND_ALARM_CAPABILITIES {
    #StructPack 4

    AcWakeSupported : BOOLEAN

    DcWakeSupported : BOOLEAN

    S4AcWakeSupported : BOOLEAN

    S4DcWakeSupported : BOOLEAN

    S5AcWakeSupported : BOOLEAN

    S5DcWakeSupported : BOOLEAN

    S4S5WakeStatusSupported : BOOLEAN

    DeepestWakeSystemState : UInt32

    RealTimeFeaturesSupported : BOOLEAN

    RealTimeResolution : ACPI_TIME_RESOLUTION

}
