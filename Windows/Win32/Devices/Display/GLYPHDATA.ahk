#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GLYPHDEF.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\POINTQF.ahk

/**
 * The GLYPHDATA structure contains information about an individual glyph.
 * @remarks
 * The quantities A, B, and C mentioned in the descriptions of GLYPHDATA members are simple transforms of the notional space versions into 28.4 device coordinates. A is the left sidebearing amount, the width of the space to the left of the glyph, B is the width of the glyph, and C is the right sidebearing amount, the width of the space to the right of the glyph. For some glyphs, A and/or C can be negative, indicating that the glyph extends farther to the left and/or right than is usually the case.
  * 
  * For a description of the FIX data type, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-glyphdata
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class GLYPHDATA extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphdef">GLYPHDEF</a> union that contains a pointer to either a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphbits">GLYPHBITS</a> structure or a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-pathobj">PATHOBJ</a> structure, depending on whether, respectively, the glyph data is in the form of a bitmap or an outline.
     * @type {GLYPHDEF}
     */
    gdf{
        get {
            if(!this.HasProp("__gdf"))
                this.__gdf := GLYPHDEF(this.ptr + 0)
            return this.__gdf
        }
    }

    /**
     * Handle to the glyph.
     * @type {Integer}
     */
    hg {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies a FIX value containing the character increment amount, D = A + B + C. The character increment amount represents the sum of the prebearing, or left sidebearing amount (A), the width of the glyph (B), and the width of the right sidebearing amount (C). The two sidebearing amounts represent the (usually) empty space immediately to the left and right of the glyph. The value stored in <b>fxD</b> is the dot product of D and a unit vector along the baseline (in device coordinates), yielding the projection of D onto the baseline.
     * @type {Integer}
     */
    fxD {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies a FIX value containing the prebearing, or left sidebearing amount, A. The value stored in <b>fxA</b> is the dot product of A and a unit vector along the baseline (in device coordinates), yielding the projection of A onto the baseline.
     * @type {Integer}
     */
    fxA {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies a FIX value containing the advancing edge of the character, A + B. The value stored in fxAB is the dot product of A + B and a unit vector along the baseline (in device coordinates), yielding the projection of A + B onto the baseline.
     * @type {Integer}
     */
    fxAB {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies a FIX value containing the distance between the baseline and the ink box top along a unit vector in the ascent direction (in device coordinates).
     * @type {Integer}
     */
    fxInkTop {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies a FIX value containing the distance between the baseline and the ink box bottom along a unit vector in the ascent direction (in device coordinates).
     * @type {Integer}
     */
    fxInkBottom {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that describes the ink box in which the glyph fits. The sides of the ink box are parallel to the x and y axes.
     * @type {RECTL}
     */
    rclInk{
        get {
            if(!this.HasProp("__rclInk"))
                this.__rclInk := RECTL(this.ptr + 40)
            return this.__rclInk
        }
    }

    /**
     * Specifies a POINTQF structure that contains the character increment vector, D = A + B + C. The high-order WORDs of <b>ptqD</b> are 28.4 device coordinates. The low-order WORDs of this member provide additional precision. For a description of the POINTQF structure, see <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {POINTQF}
     */
    ptqD{
        get {
            if(!this.HasProp("__ptqD"))
                this.__ptqD := POINTQF(this.ptr + 56)
            return this.__ptqD
        }
    }
}
