#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @charset Unicode
 */
export default struct PRINTER_CONNECTION_INFO_1W {
    #StructPack 8

    dwFlags : UInt32

    pszDriverName : PWSTR

}
