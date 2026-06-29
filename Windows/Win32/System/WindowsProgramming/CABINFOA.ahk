#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset ANSI
 */
export default struct CABINFOA {
    #StructPack 8

    pszCab : PSTR

    pszInf : PSTR

    pszSection : PSTR

    szSrcPath : CHAR[260]

    dwFlags : UInt32

}
