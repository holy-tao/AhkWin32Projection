#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION {
    #StructPack 8

    CycleTime : Int64

}
