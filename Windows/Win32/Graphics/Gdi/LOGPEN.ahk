#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }

/**
 * The LOGPEN structure defines the style, width, and color of a pen. The CreatePenIndirect function uses the LOGPEN structure.
 * @remarks
 * If the width of the pen is greater than 1 and the pen style is PS_INSIDEFRAME, the line is drawn inside the frame of all GDI objects except polygons and polylines. If the pen color does not match an available RGB value, the pen is drawn with a logical (dithered) color. If the pen width is less than or equal to 1, the PS_INSIDEFRAME style is identical to the PS_SOLID style.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-logpen
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct LOGPEN {
    #StructPack 4

    lopnStyle : UInt32

    /**
     * The <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the pen width, in logical units. If the <b>pointer</b> member is <b>NULL</b>, the pen is one pixel wide on raster devices. The <b>y</b> member in the <b>POINT</b> structure for <b>lopnWidth</b> is not used.
     */
    lopnWidth : POINT

    /**
     * The pen color. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    lopnColor : COLORREF

}
