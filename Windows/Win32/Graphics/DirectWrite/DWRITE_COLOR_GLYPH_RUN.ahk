#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_GLYPH_RUN.ahk" { DWRITE_GLYPH_RUN }
#Import ".\DWRITE_COLOR_F.ahk" { DWRITE_COLOR_F }
#Import ".\DWRITE_GLYPH_RUN_DESCRIPTION.ahk" { DWRITE_GLYPH_RUN_DESCRIPTION }
#Import ".\DWRITE_GLYPH_OFFSET.ahk" { DWRITE_GLYPH_OFFSET }
#Import ".\IDWriteFontFace.ahk" { IDWriteFontFace }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the information needed by renderers to draw glyph runs with glyph color information.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_2/ns-dwrite_2-dwrite_color_glyph_run
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_COLOR_GLYPH_RUN {
    #StructPack 8

    /**
     * Glyph run to draw for this layer.
     */
    glyphRun : DWRITE_GLYPH_RUN

    /**
     * Pointer to the glyph run description for this layer. This may be <b>NULL</b>. For example, when the original glyph run is split into multiple layers, one layer might have a description and the others have none.
     */
    glyphRunDescription : DWRITE_GLYPH_RUN_DESCRIPTION.Ptr

    /**
     * X coordinate of the baseline origin for the layer.
     */
    baselineOriginX : Float32

    /**
     * Y coordinate of the baseline origin for the layer.
     */
    baselineOriginY : Float32

    /**
     * Color value of the run; if all members are zero, the run should be drawn using the current brush.
     */
    runColor : DWRITE_COLOR_F

    /**
     * Zero-based index into the font’s color palette; if this is <b>0xFFFF</b>, the run should be drawn using the current brush.
     */
    paletteIndex : UInt16

}
