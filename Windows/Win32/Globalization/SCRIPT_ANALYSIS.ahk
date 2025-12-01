#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include .\SCRIPT_STATE.ahk

/**
 * Contains a portion of a Unicode string, that is, an &quot;item&quot;.
 * @remarks
 * This structure is filled by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemizeopentype">ScriptItemizeOpenType</a>, each of which breaks a Unicode string into individually shapeable items. Neither function accesses the <b>SCRIPT_ANALYSIS</b> structure directly. Each function handles an array of <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_item">SCRIPT_ITEM</a> structures, each of which has a member defining a <b>SCRIPT_ANALYSIS</b> structure.
 * 
 * Applications that use <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemizeopentype">ScriptItemizeOpenType</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> should also use <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshapeopentype">ScriptShapeOpenType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplaceopentype">ScriptPlaceOpenType</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplace">ScriptPlace</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/displaying-text-with-uniscribe">Displaying Text with Uniscribe</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_analysis
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_ANALYSIS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - eScript
     * - fRTL
     * - fLayoutRTL
     * - fLinkBefore
     * - fLinkAfter
     * - fLogicalOrder
     * - fNoGlyphIndex
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Opaque value identifying the engine that Uniscribe uses when calling the <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a>, <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplace">ScriptPlace</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scripttextout">ScriptTextOut</a> functions for the item. The value for this member is undefined and applications should not rely on its value being the same from one release to the next. An application can obtain the attributes of <b>eScript</b> by calling <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptgetproperties">ScriptGetProperties</a>.
     * 
     * To disable shaping, the application should set this member to SCRIPT_UNDEFINED.
     * @type {Integer}
     */
    eScript {
        get => (this._bitfield >> 0) & 0x3FF
        set => this._bitfield := ((value & 0x3FF) << 0) | (this._bitfield & ~(0x3FF << 0))
    }

    /**
     * Value indicating rendering direction. Possible values are defined in the following table. This member is set to <b>TRUE</b> for a number in a left-to-right run, because digits are always displayed left to right, or <b>FALSE</b> for a number in a right-to-left run. The value of this member is normally identical to the parity of the Unicode embedding level, but it might differ if overridden by <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getcharacterplacementa">GetCharacterPlacement</a> legacy support.
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
     * Use a right-to-left rendering direction.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use a left-to-right rendering direction.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fRTL {
        get => (this._bitfield >> 10) & 0x1
        set => this._bitfield := ((value & 0x1) << 10) | (this._bitfield & ~(0x1 << 10))
    }

    /**
     * Value indicating layout direction for a number. Possible values are defined in the following table. This member is usually the same as the value assigned to <b>fRTL</b> for a number in a right-to-left run.
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
     * Lay out the number in a right-to-left run, because it is read as part of the right-to-left sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Lay out the number in a left-to-right run, because it is read as part of the left-to-right sequence.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fLayoutRTL {
        get => (this._bitfield >> 11) & 0x1
        set => this._bitfield := ((value & 0x1) << 11) | (this._bitfield & ~(0x1 << 11))
    }

    /**
     * Value indicating if the shaping engine shapes the first character of the item as if it joins with a previous character. Possible values are defined in the following table. This member is set by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a>. The application can override the value before calling <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a>.
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
     * Shape the first character by linking with a previous character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
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
    fLinkBefore {
        get => (this._bitfield >> 12) & 0x1
        set => this._bitfield := ((value & 0x1) << 12) | (this._bitfield & ~(0x1 << 12))
    }

    /**
     * Value indicating if the shaping engine shapes the last character of the item as if it joins with a subsequent character. Possible values are defined in the following table. This member is set by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a>. The application can override the value before calling <b>ScriptItemize</b>.
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
     * Shape the last character by linking with a subsequent character.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
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
    fLinkAfter {
        get => (this._bitfield >> 13) & 0x1
        set => this._bitfield := ((value & 0x1) << 13) | (this._bitfield & ~(0x1 << 13))
    }

    /**
     * Value indicating if the shaping engine generates all glyph-related arrays in logical order. Possible values are defined in the following table. This member is set to <b>FALSE</b> by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a>. The application can override the value before calling <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a>.
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
     * Generate all glyph-related arrays in logical order.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Generate all glyph-related arrays in visual order, with the first array entry corresponding to the leftmost glyph. This value is the default.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fLogicalOrder {
        get => (this._bitfield >> 14) & 0x1
        set => this._bitfield := ((value & 0x1) << 14) | (this._bitfield & ~(0x1 << 14))
    }

    /**
     * Value indicating the use of glyphs for the item. Possible values are defined in the following table. The application can set this member to <b>TRUE</b> on input to <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a> to disable the use of glyphs for the item. Additionally, <b>ScriptShape</b> sets it to <b>TRUE</b> for a hardware context containing symbolic, unrecognized, and device fonts.
     * 
     * Disabling the use of glyphs also disables complex script shaping. Setting this member to <b>TRUE</b> implements shaping and placing directly by calls to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextextentexpointa">GetTextExtentExPoint</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-exttextouta">ExtTextOut</a>.
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
     * Disable the use of glyphs for the item. This value is used for bitmap, vector, and device fonts.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b><b>FALSE</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable the use of glyphs for the item. This value is the default.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fNoGlyphIndex {
        get => (this._bitfield >> 15) & 0x1
        set => this._bitfield := ((value & 0x1) << 15) | (this._bitfield & ~(0x1 << 15))
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state">SCRIPT_STATE</a> structure containing a copy of the Unicode algorithm state.
     * @type {SCRIPT_STATE}
     */
    s{
        get {
            if(!this.HasProp("__s"))
                this.__s := SCRIPT_STATE(2, this)
            return this.__s
        }
    }
}
