#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NEWTEXTMETRIC structure contains data that describes a physical font.
 * @remarks
 * 
 * The last four members of the <b>NEWTEXTMETRIC</b> structure are not included in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a> structure; in all other respects, the structures are identical.
 * 
 * The sizes in the <b>NEWTEXTMETRIC</b> structure are typically specified in logical units; that is, they depend on the current mapping mode of the display context.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines NEWTEXTMETRIC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-newtextmetrica
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset ANSI
 */
class NEWTEXTMETRICA extends Win32Struct
{
    static sizeof => 72

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
     * The average width of characters in the font (generally defined as the width of the letter x). This value does not include overhang required for bold or italic characters.
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
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * The value of the character to be substituted for characters that are not in the font.
     * @type {Integer}
     */
    tmDefaultChar {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * The value of the character to be used to define word breaks for text justification.
     * @type {Integer}
     */
    tmBreakChar {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * An italic font if it is nonzero.
     * @type {Integer}
     */
    tmItalic {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * An underlined font if it is nonzero.
     * @type {Integer}
     */
    tmUnderlined {
        get => NumGet(this, 49, "char")
        set => NumPut("char", value, this, 49)
    }

    /**
     * A strikeout font if it is nonzero.
     * @type {Integer}
     */
    tmStruckOut {
        get => NumGet(this, 50, "char")
        set => NumPut("char", value, this, 50)
    }

    /**
     * The pitch and family of the selected font. The low-order bit (bit 0) specifies the pitch of the font. If it is 1, the font is variable pitch (or proportional). If it is 0, the font is fixed pitch (or monospace). Bits 1 and 2 specify the font type. If both bits are 0, the font is a raster font; if bit 1 is 1 and bit 2 is 0, the font is a vector font; if bit 1 is 0 and bit 2 is set, or if both bits are 1, the font is some other type. Bit 3 is 1 if the font is a device font; otherwise, it is 0.
     * 
     * The four high-order bits designate the font family. The <b>tmPitchAndFamily</b> member can be combined with the hexadecimal value 0xF0 by using the bitwise AND operator and can then be compared with the font family names for an identical match. For more information about the font families, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>.
     * @type {Integer}
     */
    tmPitchAndFamily {
        get => NumGet(this, 51, "char")
        set => NumPut("char", value, this, 51)
    }

    /**
     * The character set of the font.
     * @type {Integer}
     */
    tmCharSet {
        get => NumGet(this, 52, "char")
        set => NumPut("char", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    ntmFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The size of the em square for the font. This value is in notional units (that is, the units for which the font was designed).
     * @type {Integer}
     */
    ntmSizeEM {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The height, in notional units, of the font. This value should be compared with the value of the <b>ntmSizeEM</b> member.
     * @type {Integer}
     */
    ntmCellHeight {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The average width of characters in the font, in notional units. This value should be compared with the value of the <b>ntmSizeEM</b> member.
     * @type {Integer}
     */
    ntmAvgWidth {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }
}
