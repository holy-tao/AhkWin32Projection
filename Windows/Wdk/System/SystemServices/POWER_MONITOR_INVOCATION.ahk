#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POWER_MONITOR_REQUEST_REASON.ahk" { POWER_MONITOR_REQUEST_REASON }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POWER_MONITOR_INVOCATION {
    #StructPack 4

    Console : BOOLEAN

    RequestReason : POWER_MONITOR_REQUEST_REASON

}
