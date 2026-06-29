#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @charset ANSI
 */
export default struct PRINTER_CONNECTION_INFO_1A {
    #StructPack 8

    dwFlags : UInt32

    pszDriverName : PSTR

}
