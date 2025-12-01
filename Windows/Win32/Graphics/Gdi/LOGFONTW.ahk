#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the attributes of a font. (LOGFONTW)
 * @remarks
 * The following situations do not support ClearType antialiasing:
 * 
 * <ul>
 * <li>Text is rendered on a printer.</li>
 * <li>Display set for 256 colors or less.</li>
 * <li>Text is rendered to a terminal server client.</li>
 * <li>The font is not a TrueType font or an Microsoft OpenType font with TrueType outlines. For example, the following do not support ClearType antialiasing: Type 1 fonts, Postscript OpenType fonts without TrueType outlines, bitmap fonts, vector fonts, and device fonts.</li>
 * <li>The font has tuned embedded bitmaps, for any font sizes that contain the embedded bitmaps. For example, this occurs commonly in East Asian fonts.</li>
 * </ul>
 * This structure first appeared in Shtypes.idl and Shtypes.h in Windows Vista, for ease of use with members of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/nn-shobjidl-ivisualproperties">IVisualProperties</a> interface. However, the identical structure is defined in Wingdi.h and Windows.h in earlier versions of Windows.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The shtypes.h header defines LOGFONT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-logfontw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class LOGFONTW extends Win32Struct
{
    static sizeof => 92

    static packingSize => 4

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the height, in logical units, of the font's character cell or character. The character height value (also known as the em height) is the character cell height value minus the internal-leading value. The font mapper interprets the value specified in <b>lfHeight</b> in the following manner.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>&gt; 0</td>
     * <td>The font mapper transforms this value into device units and matches it against the cell height of the available fonts.</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>The font mapper uses a default height value when it searches for a match.</td>
     * </tr>
     * <tr>
     * <td>&lt; 0</td>
     * <td>The font mapper transforms this value into device units and matches its absolute value against the character height of the available fonts.</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For all height comparisons, the font mapper looks for the largest font that does not exceed the requested size.
     * 
     * This mapping occurs when the font is used for the first time.
     * 
     * For the MM_TEXT mapping mode, you may use the following formula to specify a height for a font with a given point size.
     * 
     * 
     * ```cpp
     * lfHeight = -MulDiv(PointSize, GetDeviceCaps(hDC, LOGPIXELSY), 72);
     * 
     * ```
     * 
     * 
     * where <b>MulDiv</b> is defined as follows:
     * 
     * 
     * ```cpp
     * @type {Integer}
     */
    lfHeight {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the average width, in logical units, of characters in the font. If <b>lfWidth</b> is not zero, the aspect ratio of the device is matched against the digitization aspect ratio of the available fonts to find the closest match, determined by the absolute value of the difference.
     * @type {Integer}
     */
    lfWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the angle, in tenths of degrees, between the escapement vector and the x-axis of the device. The escapement vector is parallel to the base line of a row of text.
     * 
     * The <b>lfEscapement</b> member specifies both the escapement and orientation. You should set <b>lfEscapement</b> and <b>lfOrientation</b> to the same value.
     * @type {Integer}
     */
    lfEscapement {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the angle, in tenths of degrees, between each character's base line and the x-axis of the device.
     * @type {Integer}
     */
    lfOrientation {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * Specifies the weight of the font in the range 0 through 1000. For example, 400 is normal and 700 is bold. If this value is zero, a default weight is used.
     * 
     * The following values are defined in Wingdi.h for convenience.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Value</th>
     * <th>Weight</th>
     * </tr>
     * <tr>
     * <td>FW_DONTCARE</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>FW_THIN</td>
     * <td>100</td>
     * </tr>
     * <tr>
     * <td>FW_EXTRALIGHT</td>
     * <td>200</td>
     * </tr>
     * <tr>
     * <td>FW_ULTRALIGHT</td>
     * <td>200</td>
     * </tr>
     * <tr>
     * <td>FW_LIGHT</td>
     * <td>300</td>
     * </tr>
     * <tr>
     * <td>FW_NORMAL</td>
     * <td>400</td>
     * </tr>
     * <tr>
     * <td>FW_REGULAR</td>
     * <td>400</td>
     * </tr>
     * <tr>
     * <td>FW_MEDIUM</td>
     * <td>500</td>
     * </tr>
     * <tr>
     * <td>FW_SEMIBOLD</td>
     * <td>600</td>
     * </tr>
     * <tr>
     * <td>FW_DEMIBOLD</td>
     * <td>600</td>
     * </tr>
     * <tr>
     * <td>FW_BOLD</td>
     * <td>700</td>
     * </tr>
     * <tr>
     * <td>FW_EXTRABOLD</td>
     * <td>800</td>
     * </tr>
     * <tr>
     * <td>FW_ULTRABOLD</td>
     * <td>800</td>
     * </tr>
     * <tr>
     * <td>FW_HEAVY</td>
     * <td>900</td>
     * </tr>
     * <tr>
     * <td>FW_BLACK</td>
     * <td>900</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    lfWeight {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * <b>TRUE</b> to specify an italic font.
     * @type {Integer}
     */
    lfItalic {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * <b>TRUE</b> to specify an underlined font.
     * @type {Integer}
     */
    lfUnderline {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * <b>TRUE</b> to specify a strikeout font.
     * @type {Integer}
     */
    lfStrikeOut {
        get => NumGet(this, 22, "char")
        set => NumPut("char", value, this, 22)
    }

    /**
     * Type: <b>BYTE</b>
     * 
     * Specifies the character set. The following values are predefined:
     * 
     * <table class="clsStd">
     * <tr>
     * <td>ANSI_CHARSET</td>
     * <td>BALTIC_CHARSET</td>
     * </tr>
     * <tr>
     * <td>CHINESEBIG5_CHARSET</td>
     * <td>DEFAULT_CHARSET</td>
     * </tr>
     * <tr>
     * <td>EASTEUROPE_CHARSET</td>
     * <td>GB2312_CHARSET</td>
     * </tr>
     * <tr>
     * <td>GREEK_CHARSET</td>
     * <td>HANGUL_CHARSET</td>
     * </tr>
     * <tr>
     * <td>MAC_CHARSET</td>
     * <td>OEM_CHARSET</td>
     * </tr>
     * <tr>
     * <td>RUSSIAN_CHARSET</td>
     * <td>SHIFTJIS_CHARSET</td>
     * </tr>
     * <tr>
     * <td>SYMBOL_CHARSET</td>
     * <td>TURKISH_CHARSET</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Korean Windows</th>
     * </tr>
     * <tr>
     * <td>JOHAB_CHARSET</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Middle-Eastern Windows</th>
     * </tr>
     * <tr>
     * <td>HEBREW_CHARSET</td>
     * </tr>
     * <tr>
     * <td>ARABIC_CHARSET</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Thai Windows</th>
     * </tr>
     * <tr>
     * <td>THAI_CHARSET</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The OEM_CHARSET value specifies a character set that is operating-system dependent.
     * 
     * DEFAULT_CHARSET is set to a value based on the current system locale. For example, when the system locale is English (United States), the value is ANSI_CHARSET.
     * 
     * Fonts with other character sets may exist in the operating system. If an application uses a font with an unknown character set, it should not attempt to translate or interpret strings that are rendered with that font.
     * 
     * This member is important in the font mapping process. To ensure consistent results, specify a specific character set. If you specify a typeface name in the <b>lfFaceName</b> member, make sure that the <b>lfCharSet</b> value matches the character set of the typeface specified in <b>lfFaceName</b>.
     * @type {Integer}
     */
    lfCharSet {
        get => NumGet(this, 23, "char")
        set => NumPut("char", value, this, 23)
    }

    /**
     * Type: <b>BYTE</b>
     * @type {Integer}
     */
    lfOutPrecision {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * Type: <b>BYTE</b>
     * @type {Integer}
     */
    lfClipPrecision {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * Type: <b>BYTE</b>
     * @type {Integer}
     */
    lfQuality {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * Type: <b>BYTE</b>
     * @type {Integer}
     */
    lfPitchAndFamily {
        get => NumGet(this, 27, "char")
        set => NumPut("char", value, this, 27)
    }

    /**
     * Type: <b>TCHAR[LF_FACESIZE]</b>
     * 
     * Specifies a null-terminated string that specifies the typeface name of the font. The length of this string must not exceed 32 characters, including the terminating null character. The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a> function can be used to enumerate the typeface names of all currently available fonts. If <b>lfFaceName</b> is an empty string, GDI uses the first font that matches the other specified attributes.
     * @type {String}
     */
    lfFaceName {
        get => StrGet(this.ptr + 28, 31, "UTF-16")
        set => StrPut(value, this.ptr + 28, 31, "UTF-16")
    }
}
