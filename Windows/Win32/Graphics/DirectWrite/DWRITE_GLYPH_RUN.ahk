#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the information needed by renderers to draw glyph runs.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_glyph_run
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_RUN extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/nn-dwrite-idwritefontface">IDWriteFontFace</a>*</b>
     * 
     * The physical font face object to draw with.
     * @type {Pointer<IDWriteFontFace>}
     */
    fontFace {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The logical size of the font in DIPs (equals 1/96 inch), not points.
     * @type {Float}
     */
    fontEmSize {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The number of glyphs in the glyph run.
     * @type {Integer}
     */
    glyphCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>const UINT16*</b>
     * 
     * A pointer to an array of indices to render for the glyph run.
     * @type {Pointer<UInt16>}
     */
    glyphIndices {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>const FLOAT*</b>
     * 
     * A pointer to an array containing glyph advance widths for the glyph run.
     * @type {Pointer<Single>}
     */
    glyphAdvances {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset">DWRITE_GLYPH_OFFSET</a>*</b>
     * 
     * A pointer to an array containing glyph offsets for the glyph run.
     * @type {Pointer<DWRITE_GLYPH_OFFSET>}
     */
    glyphOffsets {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * If true, specifies that glyphs are rotated 90 degrees to the left and vertical metrics are used. Vertical writing is achieved by specifying <b>isSideways</b> = true and rotating the entire run 90 degrees to the right via a rotate transform.
     * @type {BOOL}
     */
    isSideways {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * The implicit resolved bidi level of the run. Odd levels indicate right-to-left languages like Hebrew and Arabic, while even levels indicate left-to-right languages like English and Japanese (when written horizontally). For right-to-left languages, the text origin is on the right, and text should be drawn to the left.
     * @type {Integer}
     */
    bidiLevel {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
