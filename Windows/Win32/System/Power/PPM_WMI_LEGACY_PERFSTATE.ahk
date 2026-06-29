#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_WMI_LEGACY_PERFSTATE {
    #StructPack 4

    Frequency : UInt32

    Flags : UInt32

    PercentFrequency : UInt32

}
