#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GCP_RESULTS structure contains information about characters in a string. This structure receives the results of the GetCharacterPlacement function. For some languages, the first element in the arrays may contain more, language-dependent information. (Unicode)
 * @remarks
 * Whether the <b>lpGlyphs</b>, <b>lpOutString</b>, or neither is required depends on the results of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getfontlanguageinfo">GetFontLanguageInfo</a> call.
 * 
 * In the case of a font for a language such as English, in which none of the GCP_DBCS, GCP_REORDER, GCP_GLYPHSHAPE, GCP_LIGATE, GCP_DIACRITIC, or GCP_KASHIDA flags are returned, neither of the arrays is required for proper operation. (Though not required, they can still be used. If the <b>lpOutString</b> array is used, it will be exactly the same as the <i>lpInputString</i> passed to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a>.) Note, however, that if GCP_MAXEXTENT is used, then <b>lpOutString</b> will contain the truncated string if it is used, NOT an exact copy of the original.
 * 
 * In the case of fonts for languages such as Hebrew, which DO have reordering but do not typically have extra glyph shapes, <b>lpOutString</b> should be used. This will give the string on the screen-readable order. However, the <b>lpGlyphs</b> array is not typically needed. (Hebrew can have extra glyphs, if the font is a TrueType/Open font.)
 * 
 * In the case of languages such as Thai or Arabic, in which <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getfontlanguageinfo">GetFontLanguageInfo</a> returns the GCP_GLYPHSHAPE flag, the <b>lpOutString</b> will give the display-readable order of the string passed to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a>, but the values will still be the unshaped characters. For proper display, the <b>lpGlyphs</b> array must be used.
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines GCP_RESULTS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-gcp_resultsw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class GCP_RESULTSW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    lStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the buffer that receives the output string or is <b>NULL</b> if the output string is not needed. The output string is a version of the original string that is in the order that will be displayed on a specified device. Typically the output string is identical to the original string, but may be different if the string needs reordering and the GCP_REORDER flag is set or if the original string exceeds the maximum extent and the GCP_MAXEXTENT flag is set.
     * @type {PWSTR}
     */
    lpOutString {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the array that receives ordering indexes or is <b>NULL</b> if the ordering indexes are not needed. However, its meaning depends on the other elements of <b>GCP_RESULTS</b>. If glyph indexes are to be returned, the indexes are for the <b>lpGlyphs</b> array; if glyphs indexes are not returned and <b>lpOrder</b> is requested, the indexes are for <b>lpOutString</b>. For example, in the latter case the value of <b>lpOrder</b>[i] is the position of <b>lpString</b>[i] in the output string lpOutString.
     * 
     * This is typically used when <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getfontlanguageinfo">GetFontLanguageInfo</a> returns the GCP_REORDER flag, which indicates that the original string needs reordering. For example, in Hebrew, in which the text runs from right to left, the <b>lpOrder</b> array gives the exact locations of each element in the original string.
     * @type {Pointer<Integer>}
     */
    lpOrder {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the array that receives the distances between adjacent character cells or is <b>NULL</b> if these distances are not needed. If glyph rendering is done, the distances are for the glyphs not the characters, so the resulting array can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> function.
     * 
     * The distances in this array are in display order. To find the distance for the <i>i</i><sup>th</sup> character in the original string, use the <b>lpOrder</b> array as follows:
     * 
     * 
     * ``` syntax
     * 
     * width = lpDx[lpOrder[i]];
     * 
     * ```
     * @type {Pointer<Integer>}
     */
    lpDx {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the array that receives the caret position values or is <b>NULL</b> if caret positions are not needed. Each value specifies the caret position immediately before the corresponding character. In some languages the position of the caret for each character may not be immediately to the left of the character. For example, in Hebrew, in which the text runs from right to left, the caret position is to the right of the character. If glyph ordering is done, <b>lpCaretPos</b> matches the original string, not the output string. This means that some adjacent values may be the same.
     * 
     * The values in this array are in input order. To find the caret position value for the <i>i</i><sup>th</sup> character in the original string, use the array as follows:
     * 
     * 
     * ``` syntax
     * 
     * position = lpCaretPos[i];
     * 
     * ```
     * @type {Pointer<Integer>}
     */
    lpCaretPos {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {PSTR}
     */
    lpClass {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the array that receives the values identifying the glyphs used for rendering the string or is <b>NULL</b> if glyph rendering is not needed. The number of glyphs in the array may be less than the number of characters in the original string if the string contains ligated glyphs. Also if reordering is required, the order of the glyphs may not be sequential.
     * 
     * This array is useful if more than one operation is being done on a string which has any form of ligation, kerning or order-switching. Using the values in this array for subsequent operations saves the time otherwise required to generate the glyph indices each time.
     * 
     * This array always contains glyph indices and the ETO_GLYPH_INDEX value must always be used when this array is used with the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a> function.
     * 
     * When GCP_LIGATE is used, you can limit the number of characters that will be ligated together. (In Arabic for example, three-character ligations are common). This is done by setting the maximum required in lpGcpResults-&gt;lpGlyphs[0]. If no maximum is required, you should set this field to zero.
     * 
     * For languages such as Arabic, where <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getfontlanguageinfo">GetFontLanguageInfo</a> returns the GCP_GLYPHSHAPE flag, the glyphs for a character will be different depending on whether the character is at the beginning, middle, or end of a word. Typically, the first character in the input string will also be the first character in a word, and the last character in the input string will be treated as the last character in a word. However, if the displayed string is a subset of the complete string, such as when displaying a section of scrolled text, this may not be true. In these cases, it is desirable to force the first or last characters to be shaped as not being initial or final forms. To do this, again, the first location in the <b>lpGlyphs</b> array is used by performing an OR operation of the ligation value above with the values GCPGLYPH_LINKBEFORE and/or GCPGLYPH_LINKAFTER. For example, a value of GCPGLYPH_LINKBEFORE | 2 means that two-character ligatures are the maximum required, and the first character in the string should be treated as if it is in the middle of a word.
     * @type {PWSTR}
     */
    lpGlyphs {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * On input, this member must be set to the size of the arrays pointed to by the array pointer members. On output, this is set to the number of glyphs filled in, in the output arrays. If glyph substitution is not required (that is, each input character maps to exactly one glyph), this member is the same as it is on input.
     * @type {Integer}
     */
    nGlyphs {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of characters that fit within the extents specified by the <i>nMaxExtent</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> function. If the GCP_MAXEXTENT or GCP_JUSTIFY value is set, this value may be less than the number of characters in the original string. This member is set regardless of whether the GCP_MAXEXTENT or GCP_JUSTIFY value is specified. Unlike <b>nGlyphs</b>, which specifies the number of output glyphs, <b>nMaxFit</b> refers to the number of characters from the input string. For Latin SBCS languages, this will be the same.
     * @type {Integer}
     */
    nMaxFit {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
