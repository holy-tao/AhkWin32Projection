#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct CCSTYLEW {
    #StructPack 4

    flStyle : UInt32

    flExtStyle : UInt32

    szText : WCHAR[256]

    lgid : UInt16

    wReserved1 : UInt16

}
