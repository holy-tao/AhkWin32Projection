#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains native digit and digit substitution settings.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_digitsubstitute
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_DIGITSUBSTITUTE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * This bitfield backs the following members:
     * - NationalDigitLanguage
     * - TraditionalDigitLanguage
     * @type {Integer}
     */
    _bitfield1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Language for native substitution.
     * @type {Integer}
     */
    NationalDigitLanguage {
        get => (this._bitfield1 >> 0) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 0) | (this._bitfield1 & ~(0xFFFF << 0))
    }

    /**
     * Language for traditional substitution.
     * @type {Integer}
     */
    TraditionalDigitLanguage {
        get => (this._bitfield1 >> 16) & 0xFFFF
        set => this._bitfield1 := ((value & 0xFFFF) << 16) | (this._bitfield1 & ~(0xFFFF << 16))
    }

    /**
     * This bitfield backs the following members:
     * - DigitSubstitute
     * @type {Integer}
     */
    _bitfield2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Substitution type. This member is normally set by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptrecorddigitsubstitution">ScriptRecordDigitSubstitution</a>. However, it can also have any of the values defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCRIPT_DIGITSUBSTITUTE_CONTEXT_"></a><a id="script_digitsubstitute_context_"></a><dl>
     * <dt><b>SCRIPT_DIGITSUBSTITUTE_CONTEXT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Substitute digits U+0030 to U+0039 using the language of the prior letters. If there are no prior letters, substitute digits using the <b>TraditionalDigitLanguage</b> member. This member is normally set to the primary language of the locale passed to <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptrecorddigitsubstitution">ScriptRecordDigitSubstitution</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCRIPT_DIGITSUBSTITUTE_NATIONAL"></a><a id="script_digitsubstitute_national"></a><dl>
     * <dt><b>SCRIPT_DIGITSUBSTITUTE_NATIONAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Substitute digits U+0030 to U+0039 using the <b>NationalDigitLanguage</b> member. This member is normally set to the national digits retrieved for the constant <a href="https://docs.microsoft.com/windows/desktop/Intl/locale-snative-constants">LOCALE_SNATIVEDIGITS</a> by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptrecorddigitsubstitution">ScriptRecordDigitSubstitution</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCRIPT_DIGITSUBSTITUTE_NONE"></a><a id="script_digitsubstitute_none"></a><dl>
     * <dt><b>SCRIPT_DIGITSUBSTITUTE_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not substitute digits. Display Unicode values U+0030 to U+0039 with European numerals.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCRIPT_DIGITSUBSTITUTE_TRADITIONAL"></a><a id="script_digitsubstitute_traditional"></a><dl>
     * <dt><b>SCRIPT_DIGITSUBSTITUTE_TRADITIONAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Substitute digits U+0030 to U+0039 using the <b>TraditionalDigitLanguage</b> member. This member is normally set to the primary language of the locale passed to <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptrecorddigitsubstitution">ScriptRecordDigitSubstitution</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DigitSubstitute {
        get => (this._bitfield2 >> 0) & 0xFF
        set => this._bitfield2 := ((value & 0xFF) << 0) | (this._bitfield2 & ~(0xFF << 0))
    }

    /**
     * Reserved; initialize to 0.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
