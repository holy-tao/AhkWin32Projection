#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_SESSION_TIMEOUTS {
    #StructPack 4

    InputTimeout : UInt32

    DisplayTimeout : UInt32

}
