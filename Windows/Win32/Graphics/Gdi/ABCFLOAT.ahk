#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ABCFLOAT structure contains the A, B, and C widths of a font character.
 * @remarks
 * 
 * The A, B, and C widths are measured along the base line of the font.
 * 
 * The character increment (total width) of a character is the sum of the A, B, and C spaces. Either the A or the C space can be negative to indicate underhangs or overhangs.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-abcfloat
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class ABCFLOAT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The A spacing of the character. The A spacing is the distance to add to the current position before drawing the character glyph.
     * @type {Float}
     */
    abcfA {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The B spacing of the character. The B spacing is the width of the drawn portion of the character glyph.
     * @type {Float}
     */
    abcfB {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The C spacing of the character. The C spacing is the distance to add to the current position to provide white space to the right of the character glyph.
     * @type {Float}
     */
    abcfC {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
