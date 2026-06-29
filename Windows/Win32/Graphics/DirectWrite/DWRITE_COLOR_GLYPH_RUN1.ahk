#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import ".\DWRITE_MEASURING_MODE.ahk" { DWRITE_MEASURING_MODE }
#Import ".\DWRITE_COLOR_F.ahk" { DWRITE_COLOR_F }
#Import ".\DWRITE_GLYPH_RUN_DESCRIPTION.ahk" { DWRITE_GLYPH_RUN_DESCRIPTION }
#Import ".\DWRITE_GLYPH_OFFSET.ahk" { DWRITE_GLYPH_OFFSET }
#Import ".\DWRITE_GLYPH_IMAGE_FORMATS.ahk" { DWRITE_GLYPH_IMAGE_FORMATS }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DWRITE_COLOR_GLYPH_RUN.ahk" { DWRITE_COLOR_GLYPH_RUN }

/**
 * Represents a color glyph run. The IDWriteFactory4::TranslateColorGlyphRun method returns an ordered collection of color glyph runs of varying types depending on what the font supports.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_color_glyph_run1
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_COLOR_GLYPH_RUN1 {
    #StructPack 8

    Base : DWRITE_COLOR_GLYPH_RUN

    /**
     * Type of glyph image format for this color run. Exactly one type will be set since TranslateColorGlyphRun has already broken down the run into separate parts.
     */
    glyphImageFormat : DWRITE_GLYPH_IMAGE_FORMATS

    /**
     * Measuring mode to use for this glyph run.
     */
    measuringMode : DWRITE_MEASURING_MODE

}
