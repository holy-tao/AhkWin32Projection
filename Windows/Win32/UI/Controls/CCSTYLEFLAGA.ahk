#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct CCSTYLEFLAGA {
    #StructPack 8

    flStyle : UInt32

    flStyleMask : UInt32

    pszStyle : PSTR

}
