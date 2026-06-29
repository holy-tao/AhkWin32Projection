#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\IO_SESSION_STATE.ahk" { IO_SESSION_STATE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_SESSION_STATE_INFORMATION {
    #StructPack 4

    SessionId : UInt32

    SessionState : IO_SESSION_STATE

    LocalSession : BOOLEAN

}
