#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DWRITE_FONT_METRICS structure specifies the metrics that are applicable to all glyphs within the font face.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_METRICS {
    #StructPack 2

    /**
     * Type: <b>UINT16</b>
     * 
     * The number of font design units per em unit. Font files use their own coordinate system of font design units. A font design unit is the smallest measurable unit in the em square, an imaginary square that is used to size and align glyphs. The concept of em square is used as a reference scale factor when defining font size and device transformation semantics. The size of one em square is also commonly used to compute the paragraph indentation value.
     */
    designUnitsPerEm : UInt16

    /**
     * Type: <b>UINT16</b>
     * 
     * The ascent value of the font face in font design units. Ascent is the distance from the top of font character alignment box to the English baseline.
     */
    ascent : UInt16

    /**
     * Type: <b>UINT16</b>
     * 
     * The descent value of the font face in font design units. Descent is the distance from the bottom of font character alignment box to the English baseline.
     */
    descent : UInt16

    /**
     * Type: <b>INT16</b>
     * 
     * The line gap in font design units. Recommended additional white space to add between lines to improve legibility. The recommended line spacing (baseline-to-baseline distance) is  the sum of <b>ascent</b>, <b>descent</b>, and <b>lineGap</b>. The line gap is usually positive or zero but can be negative, in which case the recommended line spacing is less than the height of the character alignment box.
     */
    lineGap : Int16

    /**
     * Type: <b>UINT16</b>
     * 
     * The cap height value of the font face in font design units. Cap height is the distance from the English baseline to the top of a typical English capital. Capital "H" is often used as a reference character for the purpose of calculating the cap height value.
     */
    capHeight : UInt16

    /**
     * Type: <b>UINT16</b>
     * 
     * The x-height value of the font face in font design units. x-height is the distance from the English baseline to the top of lowercase letter "x", or a similar lowercase character.
     */
    xHeight : UInt16

    /**
     * Type: <b>INT16</b>
     * 
     * The underline position value of the font face in font design units. Underline position is the position of underline relative to the English baseline. The value is usually made negative in order to place the underline below the baseline.
     */
    underlinePosition : Int16

    /**
     * Type: <b>UINT16</b>
     * 
     * The suggested underline thickness value of the font face in font design units.
     */
    underlineThickness : UInt16

    /**
     * Type: <b>INT16</b>
     * 
     * The strikethrough position value of the font face in font design units. Strikethrough position is the position of strikethrough relative to the English baseline. The value is usually made positive in order to place the strikethrough above the baseline.
     */
    strikethroughPosition : Int16

    /**
     * Type: <b>UINT16</b>
     * 
     * The suggested strikethrough thickness value of the font face in font design units.
     */
    strikethroughThickness : UInt16

}
