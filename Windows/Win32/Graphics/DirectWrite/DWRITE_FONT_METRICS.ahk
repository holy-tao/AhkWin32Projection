#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_FONT_METRICS structure specifies the metrics that are applicable to all glyphs within the font face.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_font_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_METRICS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 2

    /**
     * Type: <b>UINT16</b>
     * 
     * The number of font design units per em unit. Font files use their own coordinate system of font design units. A font design unit is the smallest measurable unit in the em square, an imaginary square that is used to size and align glyphs. The concept of em square is used as a reference scale factor when defining font size and device transformation semantics. The size of one em square is also commonly used to compute the paragraph identation value.
     * @type {Integer}
     */
    designUnitsPerEm {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The ascent value of the font face in font design units. Ascent is the distance from the top of font character alignment box to the English baseline.
     * @type {Integer}
     */
    ascent {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The descent value of the font face in font design units. Descent is the distance from the bottom of font character alignment box to the English baseline.
     * @type {Integer}
     */
    descent {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * The line gap in font design units. Recommended additional white space to add between lines to improve legibility. The recommended line spacing (baseline-to-baseline distance) is  the sum of <b>ascent</b>, <b>descent</b>, and <b>lineGap</b>. The line gap is usually positive or zero but can be negative, in which case the recommended line spacing is less than the height of the character alignment box.
     * @type {Integer}
     */
    lineGap {
        get => NumGet(this, 6, "short")
        set => NumPut("short", value, this, 6)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The cap height value of the font face in font design units. Cap height is the distance from the English baseline to the top of a typical English capital. Capital "H" is often used as a reference character for the purpose of calculating the cap height value.
     * @type {Integer}
     */
    capHeight {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The x-height value of the font face in font design units. x-height is the distance from the English baseline to the top of lowercase letter "x", or a similar lowercase character.
     * @type {Integer}
     */
    xHeight {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * The underline position value of the font face in font design units. Underline position is the position of underline relative to the English baseline. The value is usually made negative in order to place the underline below the baseline.
     * @type {Integer}
     */
    underlinePosition {
        get => NumGet(this, 12, "short")
        set => NumPut("short", value, this, 12)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The suggested underline thickness value of the font face in font design units.
     * @type {Integer}
     */
    underlineThickness {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * Type: <b>INT16</b>
     * 
     * The strikethrough position value of the font face in font design units. Strikethrough position is the position of strikethrough relative to the English baseline. The value is usually made positive in order to place the strikethrough above the baseline.
     * @type {Integer}
     */
    strikethroughPosition {
        get => NumGet(this, 16, "short")
        set => NumPut("short", value, this, 16)
    }

    /**
     * Type: <b>UINT16</b>
     * 
     * The suggested strikethrough thickness value of the font face in font design units.
     * @type {Integer}
     */
    strikethroughThickness {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}
