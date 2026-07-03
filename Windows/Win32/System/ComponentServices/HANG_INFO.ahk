#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DUMPTYPE.ahk" { DUMPTYPE }

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct HANG_INFO {
    #StructPack 4

    fAppHangMonitorEnabled : BOOL

    fTerminateOnHang : BOOL

    DumpType : DUMPTYPE

    dwHangTimeout : UInt32

    dwDumpCount : UInt32

    dwInfoMsgCount : UInt32

}
