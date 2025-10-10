#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * The GLYPHMETRICS structure contains information about the placement and orientation of a glyph in a character cell.
 * @remarks
 * 
  * Values in the <b>GLYPHMETRICS</b> structure are specified in device units.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-glyphmetrics
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GLYPHMETRICS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The width of the smallest rectangle that completely encloses the glyph (its black box).
     * @type {Integer}
     */
    gmBlackBoxX {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The height of the smallest rectangle that completely encloses the glyph (its black box).
     * @type {Integer}
     */
    gmBlackBoxY {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The x- and y-coordinates of the upper left corner of the smallest rectangle that completely encloses the glyph.
     * @type {POINT}
     */
    gmptGlyphOrigin{
        get {
            if(!this.HasProp("__gmptGlyphOrigin"))
                this.__gmptGlyphOrigin := POINT(this.ptr + 8)
            return this.__gmptGlyphOrigin
        }
    }

    /**
     * The horizontal distance from the origin of the current character cell to the origin of the next character cell.
     * @type {Integer}
     */
    gmCellIncX {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * The vertical distance from the origin of the current character cell to the origin of the next character cell.
     * @type {Integer}
     */
    gmCellIncY {
        get => NumGet(this, 18, "short")
        set => NumPut("short", value, this, 18)
    }
}
