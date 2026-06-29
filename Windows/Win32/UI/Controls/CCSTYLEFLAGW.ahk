#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct CCSTYLEFLAGW {
    #StructPack 8

    flStyle : UInt32

    flStyleMask : UInt32

    pszStyle : PWSTR

}
