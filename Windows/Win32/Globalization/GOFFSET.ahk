#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the x and y offsets of the combining glyph.
 * @remarks
 * The members of this structure are named as they are so that they are not confused with the "dx" and "dy" designators for physical units in Uniscribe functions and structures.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-goffset
 * @namespace Windows.Win32.Globalization
 */
export default struct GOFFSET {
    #StructPack 4

    /**
     * x offset, in logical units, for the combining glyph.
     */
    du : Int32

    /**
     * y offset, in logical units, for the combining glyph.
     */
    dv : Int32

}
