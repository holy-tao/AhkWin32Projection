#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_SESSION_CONNECT_INFO {
    #StructPack 4

    SessionId : UInt32

    LocalSession : BOOLEAN

}
