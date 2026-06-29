#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\EXCEPTION_RECORD64.ahk" { EXCEPTION_RECORD64 }
#Import "..\..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_LAST_EVENT_INFO_EXCEPTION {
    #StructPack 8

    ExceptionRecord : EXCEPTION_RECORD64

    FirstChance : UInt32

}
