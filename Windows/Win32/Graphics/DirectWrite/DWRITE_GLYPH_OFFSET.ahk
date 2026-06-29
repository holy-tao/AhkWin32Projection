#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The optional adjustment to a glyph's position.
 * @remarks
 * An glyph offset changes the position of a glyph without affecting the pen position. Offsets are in logical, pre-transform units.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_glyph_offset
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_GLYPH_OFFSET {
    #StructPack 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The offset in the advance direction of the run. A positive advance offset moves the glyph to the right (in pre-transform coordinates) if the run is left-to-right or to the left if the run is right-to-left.
     */
    advanceOffset : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The offset in the ascent direction, that is, the direction ascenders point. A positive ascender offset moves the glyph up (in pre-transform coordinates).  A negative ascender offset moves the glyph down.
     */
    ascenderOffset : Float32

}
