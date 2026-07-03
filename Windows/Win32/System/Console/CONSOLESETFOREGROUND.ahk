#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct CONSOLESETFOREGROUND {
    #StructPack 8

    hProcess : HANDLE

    bForeground : BOOL

}
