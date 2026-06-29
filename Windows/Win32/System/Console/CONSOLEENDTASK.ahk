#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLEENDTASK {
    #StructPack 8

    ProcessId : HANDLE

    hwnd : HWND

    ConsoleEventCode : UInt32

    ConsoleFlags : UInt32

}
