#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct WIDTHRUN {
    #StructPack 4

    wStartGlyph : UInt16

    wGlyphCount : UInt16

    loCharWidthOffset : UInt32

}
