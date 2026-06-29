#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The FONTINFO structure contains information regarding a specific font.
 * @remarks
 * GDI writes and returns this structure through <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_vgetinfo">FONTOBJ_vGetInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fontinfo
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FONTINFO {
    #StructPack 4

    /**
     * Specifies the size of this FONTINFO structure in bytes.
     */
    cjThis : UInt32

    /**
     * Is a set of capabilities flags. The allowed flags are FO_DEVICE_FONT and FO_OUTLINE_CAPABLE.
     */
    flCaps : UInt32

    /**
     * Specifies the number of glyphs in the font.
     */
    cGlyphsSupported : UInt32

    /**
     * Specifies the size of the largest glyph in 1 bit/pixel. A nonzero value implies that 1-bit-per-pixel bitmaps are supported.
     */
    cjMaxGlyph1 : UInt32

    /**
     * Specifies the size of the largest glyph in 4 bits/pixel. A nonzero value implies that 4-bit-per-pixel bitmaps are supported.
     */
    cjMaxGlyph4 : UInt32

    /**
     * Specifies the size of the largest glyph in 8 bits/pixel. A nonzero value implies that 8-bit-per-pixel bitmaps are supported.
     */
    cjMaxGlyph8 : UInt32

    /**
     * Specifies the size of the largest glyph in 32 bits/pixel. A nonzero value implies that 32-bit-per-pixel bitmaps are supported.
     */
    cjMaxGlyph32 : UInt32

}
