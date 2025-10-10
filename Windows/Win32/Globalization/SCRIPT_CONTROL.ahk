#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains script control flags for several Uniscribe functions, for example, ScriptItemize.
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-script_control
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_CONTROL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - uDefaultLanguage
     * - fContextDigits
     * - fInvertPreBoundDir
     * - fInvertPostBoundDir
     * - fLinkStringBefore
     * - fLinkStringAfter
     * - fNeutralOverride
     * - fNumericOverride
     * - fLegacyBidiClass
     * - fMergeNeutralItems
     * - fUseStandardBidi
     * - fReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Primary <a href="https://docs.microsoft.com/windows/desktop/Intl/language-identifiers">language identifier</a> for the language to use when Unicode values are ambiguous. This value is used in numeric processing to select digit shape when the <b>fDigitSubstitute</b> member of <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state">SCRIPT_STATE</a> is set.
     * @type {Integer}
     */
    uDefaultLanguage {
        get => (this._bitfield >> 0) & 0xFFFF
        set => this._bitfield := ((value & 0xFFFF) << 0) | (this._bitfield & ~(0xFFFF << 0))
    }

    /**
     * Value indicating how national digits are selected. Possible values are defined in the following table. 
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
     * Choose national digits according to the nearest previous strong text.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Choose national digits according to the value of the <b>uDefaultLanguage</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fContextDigits {
        get => (this._bitfield >> 16) & 0x1
        set => this._bitfield := ((value & 0x1) << 16) | (this._bitfield & ~(0x1 << 16))
    }

    /**
     * Value indicating if the initial context is set to the opposite of the base embedding level, or to the base embedding level itself. Possible values are defined in the following table. The application sets this member to indicate that text at the start of the string defaults to being laid out as if it follows a strong left-to-right character if the base <a href="https://docs.microsoft.com/windows/desktop/Intl/uniscribe-glossary">embedding level</a> is 0, and as if it follows a strong right-to-left character if the base embedding level is 1. This member is used for <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> legacy support.
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
     * Change the initial context to the opposite of the base embedding level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set the initial context to the base embedding level.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInvertPreBoundDir {
        get => (this._bitfield >> 17) & 0x1
        set => this._bitfield := ((value & 0x1) << 17) | (this._bitfield & ~(0x1 << 17))
    }

    /**
     * Value indicating if the final context is set to the opposite of the base embedding level, or to the base embedding level itself. Possible values are defined in the following table. The application sets this member to indicate that text at the end of the string defaults to being laid out as if it precedes strong text of the same direction as the base embedding level. It is used for <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> legacy support.
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
     * Change the final context to the opposite of the base embedding level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set the final context to the base embedding level.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInvertPostBoundDir {
        get => (this._bitfield >> 18) & 0x1
        set => this._bitfield := ((value & 0x1) << 18) | (this._bitfield & ~(0x1 << 18))
    }

    /**
     * Value indicating if the shaping engine shapes the first character of the string as if it joins with a previous character. Possible values are defined in the following table. 
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
     * Shape the first character by linking with a previous character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not shape the first character by linking with a previous character.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fLinkStringBefore {
        get => (this._bitfield >> 19) & 0x1
        set => this._bitfield := ((value & 0x1) << 19) | (this._bitfield & ~(0x1 << 19))
    }

    /**
     * Value indicating if the shaping engine shapes the last character of the string as if it is joined to a subsequent character. Possible values are defined in the following table. 
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
     * Shape the last character by linking with a subsequent character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not shape the last character by linking with a subsequent character.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fLinkStringAfter {
        get => (this._bitfield >> 20) & 0x1
        set => this._bitfield := ((value & 0x1) << 20) | (this._bitfield & ~(0x1 << 20))
    }

    /**
     * Value indicating the treatment of all neutral characters in the string. Possible values are defined in the following table. 
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
     * Set neutral items to a strong direction, that is, right-to-left or left-to-right, depending on the current embedding level. This setting effectively locks the items in place, and reordering occurs only between neutrals.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not set neutral items to a strong direction.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNeutralOverride {
        get => (this._bitfield >> 21) & 0x1
        set => this._bitfield := ((value & 0x1) << 21) | (this._bitfield & ~(0x1 << 21))
    }

    /**
     * Value indicating the treatment of all numeric characters in the string. Possible values are defined in the following table. 
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
     * Set numeric characters to a strong direction, that is, right-to-left or left-to-right, depending on the current embedding level. This setting effectively locks the items in place, and reordering occurs only between numeric characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not set numeric characters to a strong direction.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNumericOverride {
        get => (this._bitfield >> 22) & 0x1
        set => this._bitfield := ((value & 0x1) << 22) | (this._bitfield & ~(0x1 << 22))
    }

    /**
     * Value indicating the handling for plus and minus characters by the shaping engine. Possible values are defined in the following table.
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
     * Treat the plus and minus characters as for legacy bidirectional classes in pre-Windows XP operating systems. In this case, the characters are treated as neutral characters, that is, with no implied direction, and the slash character is treated as a common separator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Treat the plus and minus characters as for Windows XP and later. In this case, the characters are treated as European separators.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fLegacyBidiClass {
        get => (this._bitfield >> 23) & 0x1
        set => this._bitfield := ((value & 0x1) << 23) | (this._bitfield & ~(0x1 << 23))
    }

    /**
     * Value specifying if the shaping engine should merge neutral characters into strong items when possible. Possible values are defined in the following table. 
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
     * Merge neutral characters into strong items.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not merge neutral characters into strong items.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fMergeNeutralItems {
        get => (this._bitfield >> 24) & 0x1
        set => this._bitfield := ((value & 0x1) << 24) | (this._bitfield & ~(0x1 << 24))
    }

    /**
     * Value specifying if the shaping engine should use the standard bidirectional matching pair algorithm. Possible values are defined in the following table. 
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
     * Skip the matching pair algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the matching pair algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fUseStandardBidi {
        get => (this._bitfield >> 25) & 0x1
        set => this._bitfield := ((value & 0x1) << 25) | (this._bitfield & ~(0x1 << 25))
    }

    /**
     * Reserved; always initialize to 0.
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 26) & 0x3F
        set => this._bitfield := ((value & 0x3F) << 26) | (this._bitfield & ~(0x3F << 26))
    }
}
