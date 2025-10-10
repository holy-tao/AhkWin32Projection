#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * The LOGPEN structure defines the style, width, and color of a pen. The CreatePenIndirect function uses the LOGPEN structure.
 * @remarks
 * 
  * If the width of the pen is greater than 1 and the pen style is PS_INSIDEFRAME, the line is drawn inside the frame of all GDI objects except polygons and polylines. If the pen color does not match an available RGB value, the pen is drawn with a logical (dithered) color. If the pen width is less than or equal to 1, the PS_INSIDEFRAME style is identical to the PS_SOLID style.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-logpen
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class LOGPEN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    lopnStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the pen width, in logical units. If the <b>pointer</b> member is <b>NULL</b>, the pen is one pixel wide on raster devices. The <b>y</b> member in the <b>POINT</b> structure for <b>lopnWidth</b> is not used.
     * @type {POINT}
     */
    lopnWidth{
        get {
            if(!this.HasProp("__lopnWidth"))
                this.__lopnWidth := POINT(this.ptr + 8)
            return this.__lopnWidth
        }
    }

    /**
     * The pen color. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {Integer}
     */
    lopnColor {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
