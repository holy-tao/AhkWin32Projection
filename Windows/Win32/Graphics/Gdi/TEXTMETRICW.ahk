#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TEXTMETRIC structure contains basic information about a physical font. All sizes are specified in logical units; that is, they depend on the current mapping mode of the display context.
 * @remarks
 * 
 * > [!NOTE]
 * > The wingdi.h header defines TEXTMETRIC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-textmetricw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class TEXTMETRICW extends Win32Struct
{
    static sizeof => 60

    static packingSize => 4

    /**
     * The height (ascent + descent) of characters.
     * @type {Integer}
     */
    tmHeight {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The ascent (units above the base line) of characters.
     * @type {Integer}
     */
    tmAscent {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The descent (units below the base line) of characters.
     * @type {Integer}
     */
    tmDescent {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The amount of leading (space) inside the bounds set by the <b>tmHeight</b> member. Accent marks and other diacritical characters may occur in this area. The designer may set this member to zero.
     * @type {Integer}
     */
    tmInternalLeading {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The amount of extra leading (space) that the application adds between rows. Since this area is outside the font, it contains no marks and is not altered by text output calls in either OPAQUE or TRANSPARENT mode. The designer may set this member to zero.
     * @type {Integer}
     */
    tmExternalLeading {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The average width of characters in the font (generally defined as the width of the letter <i>x</i> ). This value does not include the overhang required for bold or italic characters.
     * @type {Integer}
     */
    tmAveCharWidth {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The width of the widest character in the font.
     * @type {Integer}
     */
    tmMaxCharWidth {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The weight of the font.
     * @type {Integer}
     */
    tmWeight {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * The extra width per string that may be added to some synthesized fonts. When synthesizing some attributes, such as bold or italic, graphics device interface (GDI) or a device may have to add width to a string on both a per-character and per-string basis. For example, GDI makes a string bold by expanding the spacing of each character and overstriking by an offset value; it italicizes a font by shearing the string. In either case, there is an overhang past the basic string. For bold strings, the overhang is the distance by which the overstrike is offset. For italic strings, the overhang is the amount the top of the font is sheared past the bottom of the font.
     * 
     * The <b>tmOverhang</b> member enables the application to determine how much of the character width returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentpoint32a">GetTextExtentPoint32</a> function call on a single character is the actual character width and how much is the per-string extra width. The actual width is the extent minus the overhang.
     * @type {Integer}
     */
    tmOverhang {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The horizontal aspect of the device for which the font was designed.
     * @type {Integer}
     */
    tmDigitizedAspectX {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * The vertical aspect of the device for which the font was designed. The ratio of the <b>tmDigitizedAspectX</b> and <b>tmDigitizedAspectY</b> members is the aspect ratio of the device for which the font was designed.
     * @type {Integer}
     */
    tmDigitizedAspectY {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * The value of the first character defined in the font.
     * @type {Integer}
     */
    tmFirstChar {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * The value of the last character defined in the font.
     * @type {Integer}
     */
    tmLastChar {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * The value of the character to be substituted for characters not in the font.
     * @type {Integer}
     */
    tmDefaultChar {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * The value of the character that will be used to define word breaks for text justification.
     * @type {Integer}
     */
    tmBreakChar {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * Specifies an italic font if it is nonzero.
     * @type {Integer}
     */
    tmItalic {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * Specifies an underlined font if it is nonzero.
     * @type {Integer}
     */
    tmUnderlined {
        get => NumGet(this, 53, "char")
        set => NumPut("char", value, this, 53)
    }

    /**
     * A strikeout font if it is nonzero.
     * @type {Integer}
     */
    tmStruckOut {
        get => NumGet(this, 54, "char")
        set => NumPut("char", value, this, 54)
    }

    /**
     * Specifies information about the pitch, the technology, and the family of a physical font.
     * 
     * The four low-order bits of this member specify information about the pitch and the technology of the font. A constant is defined for each of the four bits.
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TMPF_FIXED_PITCH</td>
     * <td>If this bit is set the font is a variable pitch font. If this bit is clear the font is a fixed pitch font. Note very carefully that those meanings are the opposite of what the constant name implies.</td>
     * </tr>
     * <tr>
     * <td>TMPF_VECTOR</td>
     * <td>If this bit is set the font is a vector font.</td>
     * </tr>
     * <tr>
     * <td>TMPF_TRUETYPE</td>
     * <td>If this bit is set the font is a TrueType font.</td>
     * </tr>
     * <tr>
     * <td>TMPF_DEVICE</td>
     * <td>If this bit is set the font is a device font.</td>
     * </tr>
     * </table>
     *  
     * 
     * An application should carefully test for qualities encoded in these low-order bits, making no arbitrary assumptions. For example, besides having their own bits set, TrueType and PostScript fonts set the TMPF_VECTOR bit. A monospace bitmap font has all of these low-order bits clear; a proportional bitmap font sets the TMPF_FIXED_PITCH bit. A Postscript printer device font sets the TMPF_DEVICE, TMPF_VECTOR, and TMPF_FIXED_PITCH bits.
     * 
     * The four high-order bits of <b>tmPitchAndFamily</b> designate the font's font family. An application can use the value 0xF0 and the bitwise AND operator to mask out the four low-order bits of <b>tmPitchAndFamily</b>, thus obtaining a value that can be directly compared with font family names to find an identical match. For information about font families, see the description of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     * @type {Integer}
     */
    tmPitchAndFamily {
        get => NumGet(this, 55, "char")
        set => NumPut("char", value, this, 55)
    }

    /**
     * 
     * @type {Integer}
     */
    tmCharSet {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }
}
