#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about special processing for each script.
 * @remarks
 * 
 * This structure is filled by the <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptgetproperties">ScriptGetProperties</a> function.
 * 
 * Many Uniscribe scripts do not correspond directly to 8-bit character sets. When some of the characters in a script are supported by more than one character set, the <b>fAmbiguousCharSet</b> member is set. The application should do further processing to determine the character set to use when requesting a font suitable for the run. For example, it might determine that the run consists of multiple languages and split the run so that a different font is used for each language.
 * 
 * The application uses the following code during initialization to get a pointer to the <b>SCRIPT_PROPERTIES</b>  array.
 * 
 * 
 * ```cpp
 * const SCRIPT_PROPERTIES **ppScriptProperties; // Array of pointers  
 *                                               // to properties 
 * int iMaxScript;
 * HRESULT hr;
 * 
 * hr = ScriptGetProperties(&ppScriptProperties, &iMaxScript);
 * 
 * ```
 * 
 * 
 * Then the application can inspect the properties of the script of an item as shown in the next example.
 * 
 * 
 * ```cpp
 * hr = ScriptItemize(pwcInChars, cInChars, cMaxItems, psControl, psState, pItems, pcItems);
 * //...
 * if (ppScriptProperties[pItems[iItem].a.eScript]->fNeedsCaretInfo) 
 *     {
 *         // Use ScriptBreak to restrict the caret from entering clusters (for example). 
 *     }
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-script_properties
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_PROPERTIES extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - langid
     * - fNumeric
     * - fComplex
     * - fNeedsWordBreaking
     * - fNeedsCaretInfo
     * - bCharSet
     * - fControl
     * - fPrivateUseArea
     * - fNeedsCharacterJustify
     * - fInvalidGlyph
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">Language identifier</a> for the language associated with the script. When a script is used for many languages, this member represents a default language. For example, Western script is represented by LANG_ENGLISH although it is also used for French, German, and other European languages.
     * @type {Integer}
     */
    langid {
        get => (this._bitfield1 >> 0) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
    }

    /**
     * Value indicating if a script contains only digits and the other characters used in writing numbers by the rules of the Unicode bidirectional algorithm. For example, currency symbols, the thousands separator, and the decimal point are classified as numeric when adjacent to or between digits. Possible values for this member are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script contains only digits and the other characters used in writing numbers by the rules of the Unicode bidirectional algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script does not contain only digits and the other characters used in writing numbers by the rules of the Unicode bidirectional algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNumeric {
        get => (this._bitfield1 >> 16) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 16) | (this._bitfield1 & ~(0x1 << 16))
    }

    /**
     * Value indicating a complex script for a language that requires special shaping or layout. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script requires special shaping or layout.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script contains no combining characters and requires no contextual shaping or reordering.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fComplex {
        get => (this._bitfield1 >> 17) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 17) | (this._bitfield1 & ~(0x1 << 17))
    }

    /**
     * Value indicating the type of word break placement for a language. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language has word break placement that requires the application to call <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptbreak">ScriptBreak</a> and that includes character positions marked by the <b>fWordStop</b> member in <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_logattr">SCRIPT_LOGATTR</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Word break placement is identified by scanning for characters marked by the <b>fWhiteSpace</b> member in <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_logattr">SCRIPT_LOGATTR</a>, or for glyphs marked by the value SCRIPT_JUSTIFY_BLANK or SCRIPT_JUSTIFY_ARABIC_BLANK for the <b>uJustification</b> member of <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_visattr">SCRIPT_VISATTR</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNeedsWordBreaking {
        get => (this._bitfield1 >> 18) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 18) | (this._bitfield1 & ~(0x1 << 18))
    }

    /**
     * Value indicating if a language, for example, Thai or Indian, restricts caret placement to cluster boundaries. Possible values are defined in the following table. To determine valid caret positions, the application inspects the <b>fCharStop</b> value in the logical attributes retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptbreak">ScriptBreak</a>, or compares adjacent values in the <i>pwLogClust</i> array retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a>.
     * 
     * <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptxtocp">ScriptXtoCP</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptcptox">ScriptCPtoX</a> automatically apply caret placement restrictions.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language restricts caret placement to cluster boundaries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The language does not restrict caret placement to cluster boundaries.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNeedsCaretInfo {
        get => (this._bitfield1 >> 19) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 19) | (this._bitfield1 & ~(0x1 << 19))
    }

    /**
     * Nominal character set associated with the script. During creation of a font suitable for displaying the script, this character set can be used as the value of the <b>lfCharSet</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a>.
     * 
     * For a new script having no character set defined, the application should typically set <b>bCharSet</b> to DEFAULT_CHARSET. See the description of member <b>fAmbiguousCharSet</b>.
     * @type {Integer}
     */
    bCharSet {
        get => (this._bitfield1 >> 20) & 0xFF
        set => this._bitfield1 := ((value & 0xFF) << 20) | (this._bitfield1 & ~(0xFF << 20))
    }

    /**
     * Value indicating if only control characters are used in the script. Possible values are defined in the following table. Note that every control character does not end up in a <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_control">SCRIPT_CONTROL</a> structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set only control characters in the script.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not set only control characters in the script.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fControl {
        get => (this._bitfield1 >> 28) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 28) | (this._bitfield1 & ~(0x1 << 28))
    }

    /**
     * Value indicating the use of a private use area, a special set of characters that is privately defined for the Unicode range U+E000 through U+F8FF. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use a private use area.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use a private use area.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fPrivateUseArea {
        get => (this._bitfield1 >> 29) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 29) | (this._bitfield1 & ~(0x1 << 29))
    }

    /**
     * Value indicating the handling of justification for the script by increasing all the spaces between letters, not just the spaces between words. Possible values are defined in the following table. When performing inter-character justification, Uniscribe inserts extra space only after glyphs marked with the SCRIPT_JUSTIFY_CHARACTER value for the <b>uJustification</b> member of <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_visattr">SCRIPT_VISATTR</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use character justification.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use character justification.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNeedsCharacterJustify {
        get => (this._bitfield1 >> 30) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 30) | (this._bitfield1 & ~(0x1 << 30))
    }

    /**
     * Value indicating if <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a> generates an invalid glyph for a script to represent invalid sequences. Possible values are defined in the following table. The application can obtain the glyph index of the invalid glyph for a particular font by calling <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptgetfontproperties">ScriptGetFontProperties</a>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Generate an invalid glyph to represent invalid sequences.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not generate an invalid glyph to represent invalid sequences.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInvalidGlyph {
        get => (this._bitfield1 >> 31) & 0x1
        set => this._bitfield1 := ((value & 0x1) << 31) | (this._bitfield1 & ~(0x1 << 31))
    }

    /**
     * This bitfield backs the following members:
     * - fInvalidLogAttr
     * - fCDM
     * - fAmbiguousCharSet
     * - fClusterSizeVaries
     * - fRejectInvalid
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Value indicating if <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptbreak">ScriptBreak</a> marks invalid combinations for a script by setting <b>fInvalid</b> in the logical attributes buffer. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Mark invalid combinations for the script.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not mark invalid combinations for the script.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInvalidLogAttr {
        get => (this._bitfield2 >> 0) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 0) | (this._bitfield2 & ~(0x1 << 0))
    }

    /**
     * Value indicating if a script contains an item that has been analyzed by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> as including Combining Diacritical Marks (U+0300 through U+36F). Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script contains an item that includes combining diacritical marks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script does not contain an item that includes combining diacritical marks.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fCDM {
        get => (this._bitfield2 >> 1) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 1) | (this._bitfield2 & ~(0x1 << 1))
    }

    /**
     * Value indicating if a script contains characters that are supported by more than one character set. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script contains characters that are supported by more than one character set. In this case, the <b>bCharSet</b> member of this structure should be ignored, and the <b>lfCharSet</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> should be set to DEFAULT_CHARSET. See the Remarks section for more information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The script does not contain characters that are supported by more than one character set.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fAmbiguousCharSet {
        get => (this._bitfield2 >> 2) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 2) | (this._bitfield2 & ~(0x1 << 2))
    }

    /**
     * Value indicating if a script, such as Arabic, might use contextual shaping that causes a string to increase in size during removal of characters. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use a variable cluster size for contextual shaping.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use a variable cluster size for contextual shaping.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fClusterSizeVaries {
        get => (this._bitfield2 >> 3) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 3) | (this._bitfield2 & ~(0x1 << 3))
    }

    /**
     * Value indicating if a script, for example, Thai, should reject invalid sequences that conventionally cause an editor program, such as Notepad, to beep and ignore keystrokes. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reject invalid sequences.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not reject invalid sequences.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fRejectInvalid {
        get => (this._bitfield2 >> 4) & 0x1
        set => this._bitfield2 := ((value & 0x1) << 4) | (this._bitfield2 & ~(0x1 << 4))
    }
}
