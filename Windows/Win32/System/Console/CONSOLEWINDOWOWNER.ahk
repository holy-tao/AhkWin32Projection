#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLEWINDOWOWNER {
    #StructPack 8

    hwnd : HWND

    ProcessId : UInt32

    ThreadId : UInt32

}
