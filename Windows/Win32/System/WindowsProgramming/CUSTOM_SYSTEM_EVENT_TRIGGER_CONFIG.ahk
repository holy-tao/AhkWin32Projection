#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct CUSTOM_SYSTEM_EVENT_TRIGGER_CONFIG {
    #StructPack 8

    Size : UInt32

    TriggerId : PWSTR

}
