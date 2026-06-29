#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EXTLOGPEN32 {
    #StructPack 4

    elpPenStyle : UInt32

    elpWidth : UInt32

    elpBrushStyle : UInt32

    elpColor : COLORREF

    elpHatch : UInt32

    elpNumEntries : UInt32

    elpStyleEntry : UInt32[1]

}
