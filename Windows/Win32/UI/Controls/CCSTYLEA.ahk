#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct CCSTYLEA {
    #StructPack 4

    flStyle : UInt32

    flExtStyle : UInt32

    szText : CHAR[256]

    lgid : UInt16

    wReserved1 : UInt16

}
