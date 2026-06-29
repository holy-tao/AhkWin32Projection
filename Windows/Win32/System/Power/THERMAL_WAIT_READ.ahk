#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct THERMAL_WAIT_READ {
    #StructPack 4

    Timeout : UInt32

    LowTemperature : UInt32

    HighTemperature : UInt32

}
