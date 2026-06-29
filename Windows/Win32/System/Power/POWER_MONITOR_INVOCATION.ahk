#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\POWER_MONITOR_REQUEST_REASON.ahk" { POWER_MONITOR_REQUEST_REASON }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_MONITOR_INVOCATION {
    #StructPack 4

    Console : BOOLEAN

    RequestReason : POWER_MONITOR_REQUEST_REASON

}
