#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct POWER_SESSION_WINLOGON {
    #StructPack 4

    SessionId : UInt32

    Console : BOOLEAN

    Locked : BOOLEAN

}
