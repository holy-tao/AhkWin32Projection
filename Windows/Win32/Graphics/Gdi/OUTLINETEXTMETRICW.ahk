#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TEXTMETRICW.ahk
#Include .\PANOSE.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk
#Include ..\..\Foundation\PSTR.ahk

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
 * @version v4.0.30319
 * @charset Unicode
 */
class OUTLINETEXTMETRICW extends Win32Struct
{
    static sizeof => 240

    static packingSize => 8

    /**
     * The size, in bytes, of the <b>OUTLINETEXTMETRIC</b> structure.
     * @type {Integer}
     */
    otmSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a> structure containing further information about the font.
     * @type {TEXTMETRICW}
     */
    otmTextMetrics{
        get {
            if(!this.HasProp("__otmTextMetrics"))
                this.__otmTextMetrics := TEXTMETRICW(this.ptr + 8)
            return this.__otmTextMetrics
        }
    }

    /**
     * A value that causes the structure to be byte-aligned.
     * @type {Integer}
     */
    otmFiller {
        get => NumGet(this, 68, "char")
        set => NumPut("char", value, this, 68)
    }

    /**
     * The PANOSE number for this font.
     * @type {PANOSE}
     */
    otmPanoseNumber{
        get {
            if(!this.HasProp("__otmPanoseNumber"))
                this.__otmPanoseNumber := PANOSE(this.ptr + 72)
            return this.__otmPanoseNumber
        }
    }

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
     * @type {Integer}
     */
    otmfsSelection {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Indicates whether the font is licensed. Licensed fonts must not be modified or exchanged. If bit 1 is set, the font may not be embedded in a document. If bit 1 is clear, the font can be embedded. If bit 2 is set, the embedding is read-only.
     * @type {Integer}
     */
    otmfsType {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The slope of the cursor. This value is 1 if the slope is vertical. Applications can use this value and the value of the <b>otmsCharSlopeRun</b> member to create an italic cursor that has the same slope as the main italic angle (specified by the <b>otmItalicAngle</b> member).
     * @type {Integer}
     */
    otmsCharSlopeRise {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * The slope of the cursor. This value is zero if the slope is vertical. Applications can use this value and the value of the <b>otmsCharSlopeRise</b> member to create an italic cursor that has the same slope as the main italic angle (specified by the <b>otmItalicAngle</b> member).
     * @type {Integer}
     */
    otmsCharSlopeRun {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * The main italic angle of the font, in tenths of a degree counterclockwise from vertical. Regular (roman) fonts have a value of zero. Italic fonts typically have a negative italic angle (that is, they lean to the right).
     * @type {Integer}
     */
    otmItalicAngle {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * The number of logical units defining the x- or y-dimension of the em square for this font. (The number of units in the x- and y-directions are always the same for an em square.)
     * @type {Integer}
     */
    otmEMSquare {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The maximum distance characters in this font extend above the base line. This is the typographic ascent for the font.
     * @type {Integer}
     */
    otmAscent {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * The maximum distance characters in this font extend below the base line. This is the typographic descent for the font.
     * @type {Integer}
     */
    otmDescent {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * The typographic line spacing.
     * @type {Integer}
     */
    otmLineGap {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Not supported.
     * @type {Integer}
     */
    otmsCapEmHeight {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Not supported.
     * @type {Integer}
     */
    otmsXHeight {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * The bounding box for the font.
     * @type {RECT}
     */
    otmrcFontBox{
        get {
            if(!this.HasProp("__otmrcFontBox"))
                this.__otmrcFontBox := RECT(this.ptr + 128)
            return this.__otmrcFontBox
        }
    }

    /**
     * The maximum distance characters in this font extend above the base line for the Macintosh computer.
     * @type {Integer}
     */
    otmMacAscent {
        get => NumGet(this, 144, "int")
        set => NumPut("int", value, this, 144)
    }

    /**
     * The maximum distance characters in this font extend below the base line for the Macintosh computer.
     * @type {Integer}
     */
    otmMacDescent {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }

    /**
     * The line-spacing information for the Macintosh computer.
     * @type {Integer}
     */
    otmMacLineGap {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * The smallest recommended size for this font, in pixels per em-square.
     * @type {Integer}
     */
    otmusMinimumPPEM {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * The recommended horizontal and vertical size for subscripts in this font.
     * @type {POINT}
     */
    otmptSubscriptSize{
        get {
            if(!this.HasProp("__otmptSubscriptSize"))
                this.__otmptSubscriptSize := POINT(this.ptr + 160)
            return this.__otmptSubscriptSize
        }
    }

    /**
     * The recommended horizontal and vertical offset for subscripts in this font. The subscript offset is measured from the character origin to the origin of the subscript character.
     * @type {POINT}
     */
    otmptSubscriptOffset{
        get {
            if(!this.HasProp("__otmptSubscriptOffset"))
                this.__otmptSubscriptOffset := POINT(this.ptr + 168)
            return this.__otmptSubscriptOffset
        }
    }

    /**
     * The recommended horizontal and vertical size for superscripts in this font.
     * @type {POINT}
     */
    otmptSuperscriptSize{
        get {
            if(!this.HasProp("__otmptSuperscriptSize"))
                this.__otmptSuperscriptSize := POINT(this.ptr + 176)
            return this.__otmptSuperscriptSize
        }
    }

    /**
     * The recommended horizontal and vertical offset for superscripts in this font. The superscript offset is measured from the character base line to the base line of the superscript character.
     * @type {POINT}
     */
    otmptSuperscriptOffset{
        get {
            if(!this.HasProp("__otmptSuperscriptOffset"))
                this.__otmptSuperscriptOffset := POINT(this.ptr + 184)
            return this.__otmptSuperscriptOffset
        }
    }

    /**
     * The width of the strikeout stroke for this font. Typically, this is the width of the em dash for the font.
     * @type {Integer}
     */
    otmsStrikeoutSize {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * The position of the strikeout stroke relative to the base line for this font. Positive values are above the base line and negative values are below.
     * @type {Integer}
     */
    otmsStrikeoutPosition {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * The thickness of the underscore character for this font.
     * @type {Integer}
     */
    otmsUnderscoreSize {
        get => NumGet(this, 200, "int")
        set => NumPut("int", value, this, 200)
    }

    /**
     * The position of the underscore character for this font.
     * @type {Integer}
     */
    otmsUnderscorePosition {
        get => NumGet(this, 204, "int")
        set => NumPut("int", value, this, 204)
    }

    /**
     * The offset from the beginning of the structure to a string specifying the family name for the font.
     * @type {PSTR}
     */
    otmpFamilyName{
        get {
            if(!this.HasProp("__otmpFamilyName"))
                this.__otmpFamilyName := PSTR(this.ptr + 208)
            return this.__otmpFamilyName
        }
    }

    /**
     * The offset from the beginning of the structure to a string specifying the typeface name for the font. (This typeface name corresponds to the name specified in the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.)
     * @type {PSTR}
     */
    otmpFaceName{
        get {
            if(!this.HasProp("__otmpFaceName"))
                this.__otmpFaceName := PSTR(this.ptr + 216)
            return this.__otmpFaceName
        }
    }

    /**
     * The offset from the beginning of the structure to a string specifying the style name for the font.
     * @type {PSTR}
     */
    otmpStyleName{
        get {
            if(!this.HasProp("__otmpStyleName"))
                this.__otmpStyleName := PSTR(this.ptr + 224)
            return this.__otmpStyleName
        }
    }

    /**
     * The offset from the beginning of the structure to a string specifying the full name for the font. This name is unique for the font and often contains a version number or other identifying information.
     * @type {PSTR}
     */
    otmpFullName{
        get {
            if(!this.HasProp("__otmpFullName"))
                this.__otmpFullName := PSTR(this.ptr + 232)
            return this.__otmpFullName
        }
    }
}
