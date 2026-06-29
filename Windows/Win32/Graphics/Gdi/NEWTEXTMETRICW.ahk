#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TMPF_FLAGS.ahk" { TMPF_FLAGS }

/**
 * The NEWTEXTMETRIC structure contains data that describes a physical font. (Unicode)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetricw
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct NEWTEXTMETRICW {
    #StructPack 8

    /**
     * The height (ascent + descent) of characters.
     */
    tmHeight : Int32

    /**
     * The ascent (units above the base line) of characters.
     */
    tmAscent : Int32

    /**
     * The descent (units below the base line) of characters.
     */
    tmDescent : Int32

    /**
     * The amount of leading (space) inside the bounds set by the <b>tmHeight</b> member. Accent marks and other diacritical characters may occur in this area. The designer may set this member to zero.
     */
    tmInternalLeading : Int32

    /**
     * The amount of extra leading (space) that the application adds between rows. Since this area is outside the font, it contains no marks and is not altered by text output calls in either OPAQUE or TRANSPARENT mode. The designer may set this member to zero.
     */
    tmExternalLeading : Int32

    /**
     * The average width of characters in the font (generally defined as the width of the letter x). This value does not include overhang required for bold or italic characters.
     */
    tmAveCharWidth : Int32

    /**
     * The width of the widest character in the font.
     */
    tmMaxCharWidth : Int32

    /**
     * The weight of the font.
     */
    tmWeight : Int32

    /**
     * The extra width per string that may be added to some synthesized fonts. When synthesizing some attributes, such as bold or italic, graphics device interface (GDI) or a device may have to add width to a string on both a per-character and per-string basis. For example, GDI makes a string bold by expanding the spacing of each character and overstriking by an offset value; it italicizes a font by shearing the string. In either case, there is an overhang past the basic string. For bold strings, the overhang is the distance by which the overstrike is offset. For italic strings, the overhang is the amount the top of the font is sheared past the bottom of the font.
     * 
     * The <b>tmOverhang</b> member enables the application to determine how much of the character width returned by a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentpoint32a">GetTextExtentPoint32</a> function call on a single character is the actual character width and how much is the per-string extra width. The actual width is the extent minus the overhang.
     */
    tmOverhang : Int32

    /**
     * The horizontal aspect of the device for which the font was designed.
     */
    tmDigitizedAspectX : Int32

    /**
     * The vertical aspect of the device for which the font was designed. The ratio of the <b>tmDigitizedAspectX</b> and <b>tmDigitizedAspectY</b> members is the aspect ratio of the device for which the font was designed.
     */
    tmDigitizedAspectY : Int32

    /**
     * The value of the first character defined in the font.
     */
    tmFirstChar : Int8

    /**
     * The value of the last character defined in the font.
     */
    tmLastChar : Int8

    /**
     * The value of the character to be substituted for characters that are not in the font.
     */
    tmDefaultChar : Int8

    /**
     * The value of the character to be used to define word breaks for text justification.
     */
    tmBreakChar : Int8

    /**
     * An italic font if it is nonzero.
     */
    tmItalic : Int8

    /**
     * An underlined font if it is nonzero.
     */
    tmUnderlined : Int8

    /**
     * A strikeout font if it is nonzero.
     */
    tmStruckOut : Int8

    /**
     * The pitch and family of the selected font. The low-order bit (bit 0) specifies the pitch of the font. If it is 1, the font is variable pitch (or proportional). If it is 0, the font is fixed pitch (or monospace). Bits 1 and 2 specify the font type. If both bits are 0, the font is a raster font; if bit 1 is 1 and bit 2 is 0, the font is a vector font; if bit 1 is 0 and bit 2 is set, or if both bits are 1, the font is some other type. Bit 3 is 1 if the font is a device font; otherwise, it is 0.
     * 
     * The four high-order bits designate the font family. The <b>tmPitchAndFamily</b> member can be combined with the hexadecimal value 0xF0 by using the bitwise AND operator and can then be compared with the font family names for an identical match. For more information about the font families, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>.
     */
    tmPitchAndFamily : TMPF_FLAGS

    /**
     * The character set of the font.
     */
    tmCharSet : Int8

    ntmFlags : UInt32

    /**
     * The size of the em square for the font. This value is in notional units (that is, the units for which the font was designed).
     */
    ntmSizeEM : UInt32

    /**
     * The height, in notional units, of the font. This value should be compared with the value of the <b>ntmSizeEM</b> member.
     */
    ntmCellHeight : UInt32

    /**
     * The average width of characters in the font, in notional units. This value should be compared with the value of the <b>ntmSizeEM</b> member.
     */
    ntmAvgWidth : UInt32

}
