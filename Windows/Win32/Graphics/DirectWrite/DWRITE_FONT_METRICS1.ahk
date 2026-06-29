#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_FONT_METRICS.ahk" { DWRITE_FONT_METRICS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DWRITE_FONT_METRICS1 structure specifies the metrics that are applicable to all glyphs within the font face.
 * @remarks
 * <b>DWRITE_FONT_METRICS1</b> inherits from <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a>:
 * 
 * 
 * ``` syntax
 * 
 * struct DWRITE_FONT_METRICS1 : public DWRITE_FONT_METRICS
 * {
 * ...
 * };
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_font_metrics1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_METRICS1 {
    #StructPack 4

    Base : DWRITE_FONT_METRICS

    /**
     * Left edge of accumulated bounding blackbox of all glyphs in the font.
     */
    glyphBoxLeft : Int16

    /**
     * Top edge of accumulated bounding blackbox of all glyphs in the font.
     */
    glyphBoxTop : Int16

    /**
     * Right edge of accumulated bounding blackbox of all glyphs in the font.
     */
    glyphBoxRight : Int16

    /**
     * Bottom edge of accumulated bounding blackbox of all glyphs in the font.
     */
    glyphBoxBottom : Int16

    /**
     * Horizontal position of the subscript relative to the baseline origin. This is typically negative (to the left) in italic and oblique fonts, and zero in regular fonts.
     */
    subscriptPositionX : Int16

    /**
     * Vertical position of the subscript relative to the baseline. This is typically negative.
     */
    subscriptPositionY : Int16

    /**
     * Horizontal size of the subscript em box in design units, used to scale the simulated subscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client uses its own policy.
     */
    subscriptSizeX : Int16

    /**
     * Vertical size of the subscript em box in design units, used to scale the simulated subscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client uses its own policy.
     */
    subscriptSizeY : Int16

    /**
     * Horizontal position of the superscript relative to the baseline origin. This is typically positive (to the right) in italic and oblique fonts, and zero in regular fonts.
     */
    superscriptPositionX : Int16

    /**
     * Vertical position of the superscript relative to the baseline. This is typically positive.
     */
    superscriptPositionY : Int16

    /**
     * Horizontal size of the superscript em box in design units, used to scale the simulated superscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client should use its own policy.
     */
    superscriptSizeX : Int16

    /**
     * Vertical size of the superscript em box in design units, used to scale the simulated superscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client should use its own policy.
     */
    superscriptSizeY : Int16

    /**
     * A Boolean value that indicates that the ascent, descent, and lineGap are based on newer 'typographic' values in the font, rather than legacy values.
     */
    hasTypographicMetrics : BOOL

}
