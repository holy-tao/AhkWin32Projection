#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct WAKE_ALARM_INFORMATION {
    #StructPack 4

    TimerIdentifier : UInt32

    Timeout : UInt32

}
