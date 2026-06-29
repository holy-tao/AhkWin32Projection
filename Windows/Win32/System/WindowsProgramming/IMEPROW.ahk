#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DATETIME.ahk" { DATETIME }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset Unicode
 */
export default struct IMEPROW {
    #StructPack 8

    hWnd : HWND

    InstDate : DATETIME

    wVersion : UInt32

    szDescription : WCHAR[50]

    szName : WCHAR[80]

    szOptions : WCHAR[30]

}
