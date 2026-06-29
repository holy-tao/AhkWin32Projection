#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * The GLYPHMETRICS structure contains information about the placement and orientation of a glyph in a character cell.
 * @remarks
 * Values in the <b>GLYPHMETRICS</b> structure are specified in device units.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-glyphmetrics
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GLYPHMETRICS {
    #StructPack 4

    /**
     * The width of the smallest rectangle that completely encloses the glyph (its black box).
     */
    gmBlackBoxX : UInt32

    /**
     * The height of the smallest rectangle that completely encloses the glyph (its black box).
     */
    gmBlackBoxY : UInt32

    /**
     * The x- and y-coordinates of the upper left corner of the smallest rectangle that completely encloses the glyph.
     */
    gmptGlyphOrigin : POINT

    /**
     * The horizontal distance from the origin of the current character cell to the origin of the next character cell.
     */
    gmCellIncX : Int16

    /**
     * The vertical distance from the origin of the current character cell to the origin of the next character cell.
     */
    gmCellIncY : Int16

}
