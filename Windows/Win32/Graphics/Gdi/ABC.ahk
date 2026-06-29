#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ABC structure contains the width of a character in a TrueType font.
 * @remarks
 * The total width of a character is the summation of the A, B, and C spaces. Either the A or the C space can be negative to indicate underhangs or overhangs.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-abc
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ABC {
    #StructPack 4

    /**
     * The A spacing of the character. The A spacing is the distance to add to the current position before drawing the character glyph.
     */
    abcA : Int32

    /**
     * The B spacing of the character. The B spacing is the width of the drawn portion of the character glyph.
     */
    abcB : UInt32

    /**
     * The C spacing of the character. The C spacing is the distance to add to the current position to provide white space to the right of the character glyph.
     */
    abcC : Int32

}
