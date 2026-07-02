#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\DATETIME.ahk" { DATETIME }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset ANSI
 */
export default struct IMEPROA {
    #StructPack 8

    hWnd : HWND

    InstDate : DATETIME

    wVersion : UInt32

    szDescription : Int8[50]

    szName : Int8[80]

    szOptions : Int8[30]

}
