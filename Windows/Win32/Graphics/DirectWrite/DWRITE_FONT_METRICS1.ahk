#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_FONT_METRICS.ahk

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
 * @version v4.0.30319
 */
class DWRITE_FONT_METRICS1 extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {DWRITE_FONT_METRICS}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := DWRITE_FONT_METRICS(this.ptr + 0)
            return this.__Base
        }
    }

    /**
     * Left edge of accumulated bounding blackbox of all glyphs in the font.
     * @type {Integer}
     */
    glyphBoxLeft {
        get => NumGet(this, 20, "short")
        set => NumPut("short", value, this, 20)
    }

    /**
     * Top edge of accumulated bounding blackbox of all glyphs in the font.
     * @type {Integer}
     */
    glyphBoxTop {
        get => NumGet(this, 22, "short")
        set => NumPut("short", value, this, 22)
    }

    /**
     * Right edge of accumulated bounding blackbox of all glyphs in the font.
     * @type {Integer}
     */
    glyphBoxRight {
        get => NumGet(this, 24, "short")
        set => NumPut("short", value, this, 24)
    }

    /**
     * Bottom edge of accumulated bounding blackbox of all glyphs in the font.
     * @type {Integer}
     */
    glyphBoxBottom {
        get => NumGet(this, 26, "short")
        set => NumPut("short", value, this, 26)
    }

    /**
     * Horizontal position of the subscript relative to the baseline origin. This is typically negative (to the left) in italic and oblique fonts, and zero in regular fonts.
     * @type {Integer}
     */
    subscriptPositionX {
        get => NumGet(this, 28, "short")
        set => NumPut("short", value, this, 28)
    }

    /**
     * Vertical position of the subscript relative to the baseline. This is typically negative.
     * @type {Integer}
     */
    subscriptPositionY {
        get => NumGet(this, 30, "short")
        set => NumPut("short", value, this, 30)
    }

    /**
     * Horizontal size of the subscript em box in design units, used to scale the simulated subscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client uses its own policy.
     * @type {Integer}
     */
    subscriptSizeX {
        get => NumGet(this, 32, "short")
        set => NumPut("short", value, this, 32)
    }

    /**
     * Vertical size of the subscript em box in design units, used to scale the simulated subscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client uses its own policy.
     * @type {Integer}
     */
    subscriptSizeY {
        get => NumGet(this, 34, "short")
        set => NumPut("short", value, this, 34)
    }

    /**
     * Horizontal position of the superscript relative to the baseline origin. This is typically positive (to the right) in italic and oblique fonts, and zero in regular fonts.
     * @type {Integer}
     */
    superscriptPositionX {
        get => NumGet(this, 36, "short")
        set => NumPut("short", value, this, 36)
    }

    /**
     * Vertical position of the superscript relative to the baseline. This is typically positive.
     * @type {Integer}
     */
    superscriptPositionY {
        get => NumGet(this, 38, "short")
        set => NumPut("short", value, this, 38)
    }

    /**
     * Horizontal size of the superscript em box in design units, used to scale the simulated superscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client should use its own policy.
     * @type {Integer}
     */
    superscriptSizeX {
        get => NumGet(this, 40, "short")
        set => NumPut("short", value, this, 40)
    }

    /**
     * Vertical size of the superscript em box in design units, used to scale the simulated superscript relative to the full em box size. This is the numerator of the scaling ratio where denominator is the design units per em. If this member is zero, the font does not specify a scale factor, and the client should use its own policy.
     * @type {Integer}
     */
    superscriptSizeY {
        get => NumGet(this, 42, "short")
        set => NumPut("short", value, this, 42)
    }

    /**
     * A Boolean value that indicates that the ascent, descent, and lineGap are based on newer 'typographic' values in the font, rather than legacy values.
     * @type {Integer}
     */
    hasTypographicMetrics {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }
}
