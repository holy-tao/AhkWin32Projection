#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POINTFLOAT.ahk

/**
 * The GLYPHMETRICSFLOAT structure contains information about the placement and orientation of a glyph in a character cell.
 * @remarks
 * The values of <b>GLYPHMETRICSFLOAT</b> are specified as notional units.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-glyphmetricsfloat
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class GLYPHMETRICSFLOAT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Specifies the width of the smallest rectangle (the glyph's black box) that completely encloses the glyph.
     * @type {Float}
     */
    gmfBlackBoxX {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Specifies the height of the smallest rectangle (the glyph's black box) that completely encloses the glyph.
     * @type {Float}
     */
    gmfBlackBoxY {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Specifies the x and y coordinates of the upper-left corner of the smallest rectangle that completely encloses the glyph.
     * @type {POINTFLOAT}
     */
    gmfptGlyphOrigin{
        get {
            if(!this.HasProp("__gmfptGlyphOrigin"))
                this.__gmfptGlyphOrigin := POINTFLOAT(8, this)
            return this.__gmfptGlyphOrigin
        }
    }

    /**
     * Specifies the horizontal distance from the origin of the current character cell to the origin of the next character cell.
     * @type {Float}
     */
    gmfCellIncX {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Specifies the vertical distance from the origin of the current character cell to the origin of the next character cell.
     * @type {Float}
     */
    gmfCellIncY {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
