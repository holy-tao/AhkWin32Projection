#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POWER_SESSION_RIT_STATE {
    #StructPack 8

    Active : BOOLEAN

    LastInputTime : Int64

}
