#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\POINTFLOAT.ahk" { POINTFLOAT }

/**
 * The GLYPHMETRICSFLOAT structure contains information about the placement and orientation of a glyph in a character cell.
 * @remarks
 * The values of <b>GLYPHMETRICSFLOAT</b> are specified as notional units.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-glyphmetricsfloat
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct GLYPHMETRICSFLOAT {
    #StructPack 4

    /**
     * Specifies the width of the smallest rectangle (the glyph's black box) that completely encloses the glyph.
     */
    gmfBlackBoxX : Float32

    /**
     * Specifies the height of the smallest rectangle (the glyph's black box) that completely encloses the glyph.
     */
    gmfBlackBoxY : Float32

    /**
     * Specifies the x and y coordinates of the upper-left corner of the smallest rectangle that completely encloses the glyph.
     */
    gmfptGlyphOrigin : POINTFLOAT

    /**
     * Specifies the horizontal distance from the origin of the current character cell to the origin of the next character cell.
     */
    gmfCellIncX : Float32

    /**
     * Specifies the vertical distance from the origin of the current character cell to the origin of the next character cell.
     */
    gmfCellIncY : Float32

}
