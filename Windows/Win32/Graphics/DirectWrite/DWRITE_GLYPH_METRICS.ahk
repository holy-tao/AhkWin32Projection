#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the metrics of an individual glyph.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_METRICS extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Type: <b>INT32</b>
     * 
     * Specifies the X offset from the glyph origin to the left edge of the black box. The glyph origin is the current horizontal writing position. A negative value means the black box extends to the left of the origin (often true for lowercase italic 'f').
     * @type {Integer}
     */
    leftSideBearing {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Specifies the X offset from the origin of the current glyph to the origin of the next glyph when writing horizontally.
     * @type {Integer}
     */
    advanceWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>INT32</b>
     * 
     * Specifies the X offset from the right edge of the black box to the origin of the next glyph when writing horizontally. The value is negative when the right edge of the black box overhangs the layout box.
     * @type {Integer}
     */
    rightSideBearing {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>INT32</b>
     * 
     * Specifies the vertical offset from the vertical origin to the top of the black box. Thus, a positive value adds whitespace whereas a negative value means the glyph overhangs the top of the layout box.
     * @type {Integer}
     */
    topSideBearing {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * Specifies the Y offset from the vertical origin of the current glyph to the vertical origin of the next glyph when writing vertically. Note that the term "origin" by itself denotes the horizontal origin. The vertical origin is different. Its Y coordinate is specified by <b>verticalOriginY</b> value, and its X coordinate is half the <b>advanceWidth</b> to the right of the horizontal origin.
     * @type {Integer}
     */
    advanceHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>INT32</b>
     * 
     * Specifies the vertical distance from the bottom edge of the black box to the advance height. This is positive when the bottom edge of the black box is within the layout box, or negative when the bottom edge of black box overhangs the layout box.
     * @type {Integer}
     */
    bottomSideBearing {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>INT32</b>
     * 
     * Specifies the Y coordinate of a glyph's vertical origin, in the font's design coordinate system. The y coordinate of a glyph's vertical origin is the sum of the glyph's top side bearing and the top (that is, yMax) of the glyph's bounding box.
     * @type {Integer}
     */
    verticalOriginY {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
