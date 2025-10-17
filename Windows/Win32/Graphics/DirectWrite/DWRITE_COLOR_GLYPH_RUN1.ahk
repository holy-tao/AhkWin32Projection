#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_GLYPH_RUN.ahk
#Include .\DWRITE_COLOR_F.ahk
#Include .\DWRITE_COLOR_GLYPH_RUN.ahk

/**
 * Represents a color glyph run. The IDWriteFactory4::TranslateColorGlyphRun method returns an ordered collection of color glyph runs of varying types depending on what the font supports.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_3/ns-dwrite_3-dwrite_color_glyph_run1
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_COLOR_GLYPH_RUN1 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {DWRITE_COLOR_GLYPH_RUN}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := DWRITE_COLOR_GLYPH_RUN(0, this)
            return this.__Base
        }
    }

    /**
     * Type of glyph image format for this color run. Exactly one type will be set since TranslateColorGlyphRun has already broken down the run into separate parts.
     * @type {Integer}
     */
    glyphImageFormat {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Measuring mode to use for this glyph run.
     * @type {Integer}
     */
    measuringMode {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }
}
