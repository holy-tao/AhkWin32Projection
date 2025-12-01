#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains script state information.
 * @remarks
 * This structure is used to initialize the Unicode algorithm state as an input to <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a>. It is also used as a component of the analysis retrieved by <b>ScriptItemize</b>.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_STATE extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - uBidiLevel
     * - fOverrideDirection
     * - fInhibitSymSwap
     * - fCharShape
     * - fDigitSubstitute
     * - fInhibitLigate
     * - fDisplayZWG
     * - fArabicNumContext
     * - fGcpClusters
     * - fReserved
     * - fEngineReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Embedding level associated with all characters in the associated run according to the Unicode bidirectional algorithm. When the application passes this structure to <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a>, this member should be initialized to 0 for a left-to-right base embedding level, or to 1 for a right-to-left base embedding level.
     * @type {Integer}
     */
    uBidiLevel {
        get => (this._bitfield >> 0) & 0x1F
        set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
    }

    /**
     * Initial override direction value indicating if the script uses an override level (LRO or RLO code in the string). Possible values are defined in the following table. For an override level, characters are laid out in one direction only, either left to right or right to left. No reordering of digits or strong characters of opposing direction takes place. Note that this value is reset by LRE, RLE, LRO or RLO codes in the string.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use an override level that reflects the embedding level.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use an override level that reflects the embedding level.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fOverrideDirection {
        get => (this._bitfield >> 5) & 0x1
        set => this._bitfield := ((value & 0x1) << 5) | (this._bitfield & ~(0x1 << 5))
    }

    /**
     * Value indicating if the shaping engine bypasses mirroring of Unicode mirrored glyphs, for example, brackets. Possible values are defined in the following table. This member is set by Unicode character ISS, and cleared by ASS.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bypass mirroring of Unicode mirrored glyphs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not bypass mirroring of Unicode mirrored glyphs.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInhibitSymSwap {
        get => (this._bitfield >> 6) & 0x1
        set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
    }

    /**
     * Not implemented. Value indicating if character codes in the Arabic Presentation Forms areas of Unicode should be shaped. Possible values are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Shape character codes in the Arabic Presentation Forms areas of Unicode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not shape character codes in the Arabic Presentation Forms areas of Unicode.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fCharShape {
        get => (this._bitfield >> 7) & 0x1
        set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
    }

    /**
     * This member provides the same control over digit substitution behavior that might have been obtained in legacy implementations using the now-deprecated Unicode characters U+206E NATIONAL DIGIT SHAPES ("NADS") and U+206F NOMINAL DIGIT SHAPES ("NODS"). Possible values are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Character codes U+0030 through U+0039 are substituted by national digits. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Character codes U+0030 through U+0039 are  not substituted by national digits. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fDigitSubstitute {
        get => (this._bitfield >> 8) & 0x1
        set => this._bitfield := ((value & 0x1) << 8) | (this._bitfield & ~(0x1 << 8))
    }

    /**
     * Value indicating if ligatures are used in the shaping of Arabic or Hebrew characters. Possible values are defined in the following table. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use ligatures in the shaping of Arabic or Hebrew characters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use ligatures in the shaping of Arabic or Hebrew characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInhibitLigate {
        get => (this._bitfield >> 9) & 0x1
        set => this._bitfield := ((value & 0x1) << 9) | (this._bitfield & ~(0x1 << 9))
    }

    /**
     * Value indicating if nondisplayable control characters are shaped as representational glyphs for languages that need reordering or different glyph shapes, depending on the positions of the characters within a word. Possible values are defined in the following table. Typically, the characters are not displayed. They are shaped to the blank glyph and given a width of 0.
     * 	 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Shape control characters as representational glyphs. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not shape control characters as representational glyphs. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fDisplayZWG {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * Value indicating if prior strong characters are Arabic for the purposes of rule P0, as discussed in the Unicode Standard, version 2.0. Possible values are defined in the following table. This member should normally be set to <b>TRUE</b> before itemization of a right-to-left paragraph in an Arabic language, and to <b>FALSE</b> otherwise.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Consider prior strong characters to be Arabic for the purposes of rule P0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not consider prior strong characters to be Arabic for the purposes of rule P0.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fArabicNumContext {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * For <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> legacy support only. Value indicating how <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a> should generate the array indicated by <i>pwLogClust</i>. Possible values are defined in the following table. This member affects only Arabic and Hebrew items.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b><b>TRUE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Generate the array the same way as <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> does.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not generate the array the same way as <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> does.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fGcpClusters {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * Reserved; always initialize to 0.
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * Reserved; always initialize to 0.
     * @type {Integer}
     */
    fEngineReserved {
        get => (this._bitfield >> 14) & 0x3
        set => this._bitfield := ((value & 0x3) << 14) | (this._bitfield & ~(0x3 << 14))
    }
}
