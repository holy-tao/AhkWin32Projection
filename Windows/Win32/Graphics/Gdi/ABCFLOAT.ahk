#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ABCFLOAT structure contains the A, B, and C widths of a font character.
 * @remarks
 * The A, B, and C widths are measured along the base line of the font.
 * 
 * The character increment (total width) of a character is the sum of the A, B, and C spaces. Either the A or the C space can be negative to indicate underhangs or overhangs.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-abcfloat
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct ABCFLOAT {
    #StructPack 4

    /**
     * The A spacing of the character. The A spacing is the distance to add to the current position before drawing the character glyph.
     */
    abcfA : Float32

    /**
     * The B spacing of the character. The B spacing is the width of the drawn portion of the character glyph.
     */
    abcfB : Float32

    /**
     * The C spacing of the character. The C spacing is the distance to add to the current position to provide white space to the right of the character glyph.
     */
    abcfC : Float32

}
