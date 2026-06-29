#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_GLYPH_OFFSET.ahk" { DWRITE_GLYPH_OFFSET }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the information needed by renderers to draw glyph runs.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_run
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_GLYPH_RUN {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * The physical font face object to draw with.
     */
    fontFace : IDWriteFontFace

    /**
     * Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIPs (equals 1/96 inch), not points.
     */
    fontEmSize : Float32

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of glyphs in the glyph run.
     */
    glyphCount : UInt32

    /**
     * Type: <b>const UINT16*</b>
     * 
     * A pointer to an array of indices to render for the glyph run.
     */
    glyphIndices : IntPtr

    /**
     * Type: <b>const FLOAT*</b>
     * 
     * A pointer to an array containing glyph advance widths for the glyph run.
     */
    glyphAdvances : IntPtr

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * A pointer to an array containing glyph offsets for the glyph run.
     */
    glyphOffsets : DWRITE_GLYPH_OFFSET.Ptr

    /**
     * Type: <b>BOOL</b>
     * 
     * If true, specifies that glyphs are rotated 90 degrees to the left and vertical metrics are used. Vertical writing is achieved by specifying <b>isSideways</b> = true and rotating the entire run 90 degrees to the right via a rotate transform.
     */
    isSideways : BOOL

    /**
     * Type: <b>UINT32</b>
     * 
     * The implicit resolved bidi level of the run. Odd levels indicate right-to-left languages like Hebrew and Arabic, while even levels indicate left-to-right languages like English and Japanese (when written horizontally). For right-to-left languages, the text origin is on the right, and text should be drawn to the left.
     */
    bidiLevel : UInt32

}
