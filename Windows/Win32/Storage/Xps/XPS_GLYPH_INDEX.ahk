#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the placement and location of a glyph.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ns-xpsobjectmodel-xps_glyph_index
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct XPS_GLYPH_INDEX {
    #StructPack 4

    /**
     * The index of a glyph in the physical font.
     */
    index : Int32

    /**
     * Indicates the  placement of the glyph that follows,  relative to the origin of the current glyph. Measured in hundredths of the font's em-size.
     */
    advanceWidth : Float32

    /**
     * The horizontal distance, in the effective coordinate space, by which to move the glyph from the glyph's origin. Measured in hundredths of the font's em-size.
     */
    horizontalOffset : Float32

    /**
     * The vertical distance, in the effective coordinate space, by which to move the glyph from the glyph's origin. Measured in hundredths of the font's  em-size.
     */
    verticalOffset : Float32

}
