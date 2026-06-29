#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAN_LETT_FORM.ahk" { PAN_LETT_FORM }
#Import ".\TEXTMETRICW.ahk" { TEXTMETRICW }
#Import ".\PAN_MIDLINE.ahk" { PAN_MIDLINE }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\PAN_PROPORTION.ahk" { PAN_PROPORTION }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\PANOSE.ahk" { PANOSE }
#Import ".\TMPF_FLAGS.ahk" { TMPF_FLAGS }
#Import ".\PAN_FAMILY_TYPE.ahk" { PAN_FAMILY_TYPE }
#Import ".\PAN_XHEIGHT.ahk" { PAN_XHEIGHT }
#Import ".\PAN_SERIF_STYLE.ahk" { PAN_SERIF_STYLE }
#Import ".\PAN_CONTRAST.ahk" { PAN_CONTRAST }
#Import ".\PAN_STROKE_VARIATION.ahk" { PAN_STROKE_VARIATION }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\PAN_ARM_STYLE.ahk" { PAN_ARM_STYLE }
#Import ".\PAN_WEIGHT.ahk" { PAN_WEIGHT }

/**
 * The OUTLINETEXTMETRIC structure contains metrics describing a TrueType font. (Unicode)
 * @remarks
 * The sizes returned in <b>OUTLINETEXTMETRIC</b> are specified in logical units; that is, they depend on the current mapping mode of the specified display context.
 * 
 * Note, <b>OUTLINETEXTMETRIC</b> is defined using the current pack setting. To avoid problems, make sure that the application is built using the platform default packing. For example, 32-bit Windows uses a default of 8-byte packing. For more information, see the MSDN topic "C-Compiler Packing Issues".
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines OUTLINETEXTMETRIC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-outlinetextmetricw
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct OUTLINETEXTMETRICW {
    #StructPack 8

    /**
     * The size, in bytes, of the <b>OUTLINETEXTMETRIC</b> structure.
     */
    otmSize : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a> structure containing further information about the font.
     */
    otmTextMetrics : TEXTMETRICW

    /**
     * A value that causes the structure to be byte-aligned.
     */
    otmFiller : Int8

    /**
     * The PANOSE number for this font.
     */
    otmPanoseNumber : PANOSE

    /**
     * The nature of the font pattern. This member can be a combination of the following bits.
     * 
     * <table>
     * <tr>
     * <th>Bit</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Italic</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Underscore</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Negative</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Outline</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>Strikeout</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>Bold</td>
     * </tr>
     * </table>
     */
    otmfsSelection : UInt32

    /**
     * Indicates whether the font is licensed. Licensed fonts must not be modified or exchanged. If bit 1 is set, the font may not be embedded in a document. If bit 1 is clear, the font can be embedded. If bit 2 is set, the embedding is read-only.
     */
    otmfsType : UInt32

    /**
     * The slope of the cursor. This value is 1 if the slope is vertical. Applications can use this value and the value of the <b>otmsCharSlopeRun</b> member to create an italic cursor that has the same slope as the main italic angle (specified by the <b>otmItalicAngle</b> member).
     */
    otmsCharSlopeRise : Int32

    /**
     * The slope of the cursor. This value is zero if the slope is vertical. Applications can use this value and the value of the <b>otmsCharSlopeRise</b> member to create an italic cursor that has the same slope as the main italic angle (specified by the <b>otmItalicAngle</b> member).
     */
    otmsCharSlopeRun : Int32

    /**
     * The main italic angle of the font, in tenths of a degree counterclockwise from vertical. Regular (roman) fonts have a value of zero. Italic fonts typically have a negative italic angle (that is, they lean to the right).
     */
    otmItalicAngle : Int32

    /**
     * The number of logical units defining the x- or y-dimension of the em square for this font. (The number of units in the x- and y-directions are always the same for an em square.)
     */
    otmEMSquare : UInt32

    /**
     * The maximum distance characters in this font extend above the base line. This is the typographic ascent for the font.
     */
    otmAscent : Int32

    /**
     * The maximum distance characters in this font extend below the base line. This is the typographic descent for the font.
     */
    otmDescent : Int32

    /**
     * The typographic line spacing.
     */
    otmLineGap : UInt32

    /**
     * Not supported.
     */
    otmsCapEmHeight : UInt32

    /**
     * Not supported.
     */
    otmsXHeight : UInt32

    /**
     * The bounding box for the font.
     */
    otmrcFontBox : RECT

    /**
     * The maximum distance characters in this font extend above the base line for the Macintosh computer.
     */
    otmMacAscent : Int32

    /**
     * The maximum distance characters in this font extend below the base line for the Macintosh computer.
     */
    otmMacDescent : Int32

    /**
     * The line-spacing information for the Macintosh computer.
     */
    otmMacLineGap : UInt32

    /**
     * The smallest recommended size for this font, in pixels per em-square.
     */
    otmusMinimumPPEM : UInt32

    /**
     * The recommended horizontal and vertical size for subscripts in this font.
     */
    otmptSubscriptSize : POINT

    /**
     * The recommended horizontal and vertical offset for subscripts in this font. The subscript offset is measured from the character origin to the origin of the subscript character.
     */
    otmptSubscriptOffset : POINT

    /**
     * The recommended horizontal and vertical size for superscripts in this font.
     */
    otmptSuperscriptSize : POINT

    /**
     * The recommended horizontal and vertical offset for superscripts in this font. The superscript offset is measured from the character base line to the base line of the superscript character.
     */
    otmptSuperscriptOffset : POINT

    /**
     * The width of the strikeout stroke for this font. Typically, this is the width of the em dash for the font.
     */
    otmsStrikeoutSize : UInt32

    /**
     * The position of the strikeout stroke relative to the base line for this font. Positive values are above the base line and negative values are below.
     */
    otmsStrikeoutPosition : Int32

    /**
     * The thickness of the underscore character for this font.
     */
    otmsUnderscoreSize : Int32

    /**
     * The position of the underscore character for this font.
     */
    otmsUnderscorePosition : Int32

    /**
     * The offset from the beginning of the structure to a string specifying the family name for the font.
     */
    otmpFamilyName : PSTR

    /**
     * The offset from the beginning of the structure to a string specifying the typeface name for the font. (This typeface name corresponds to the name specified in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.)
     */
    otmpFaceName : PSTR

    /**
     * The offset from the beginning of the structure to a string specifying the style name for the font.
     */
    otmpStyleName : PSTR

    /**
     * The offset from the beginning of the structure to a string specifying the full name for the font. This name is unique for the font and often contains a version number or other identifying information.
     */
    otmpFullName : PSTR

}
