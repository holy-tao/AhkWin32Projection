#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the placement and location of a glyph.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_GLYPH_INDEX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The index of a glyph in the physical font.
     * @type {Integer}
     */
    index {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates the  placement of the glyph that follows,  relative to the origin of the current glyph. Measured in hundredths of the font's em-size.
     * @type {Float}
     */
    advanceWidth {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The horizontal distance, in the effective coordinate space, by which to move the glyph from the glyph's origin. Measured in hundredths of the font's em-size.
     * @type {Float}
     */
    horizontalOffset {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The vertical distance, in the effective coordinate space, by which to move the glyph from the glyph's origin. Measured in hundredths of the font's  em-size.
     * @type {Float}
     */
    verticalOffset {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
