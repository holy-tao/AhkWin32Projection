#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset Unicode
 */
export default struct CABINFOW {
    #StructPack 8

    pszCab : PWSTR

    pszInf : PWSTR

    pszSection : PWSTR

    szSrcPath : WCHAR[260]

    dwFlags : UInt32

}
