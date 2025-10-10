#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains attributes of logical characters that are useful when editing and formatting text.
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-script_logattr
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_LOGATTR extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * This bitfield backs the following members:
     * - fSoftBreak
     * - fWhiteSpace
     * - fCharStop
     * - fWordStop
     * - fInvalid
     * - fReserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Value indicating if breaking the line in front of the character, called a "soft break", is valid. Possible values are defined in the following table. This member is set on the first character of Southeast Asian words.
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
     * A soft break is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A soft break is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fSoftBreak {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Value indicating if the character is one of the many Unicode characters classified as breakable white space. Possible values are defined in the following table. Breakable white space can break a word. All white space is breakable except nonbreaking space (NBSP) and zero-width nonbreaking space (ZWNBSP). 
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
     * The character is breakable white space. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character is not breakable white space. 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fWhiteSpace {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }

    /**
     * Value indicating if the character is a valid position for showing the caret upon a character movement keyboard action. Possible values are defined in the following table. This member is set for most characters, but not on code points inside Indian and Southeast Asian character clusters. This member can be used to implement LEFT ARROW and RIGHT ARROW operations in editors.
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
     * The character is a valid position for showing the caret upon a character movement keyboard action. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character is not a valid position for showing the caret upon a character movement keyboard action.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fCharStop {
        get => (this._bitfield >> 2) & 0x1
        set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
    }

    /**
     * Value indicating the valid position for showing the caret upon a word movement keyboard action, such as CTRL+LEFT ARROW and CTRL+RIGHT ARROW. Possible values are defined in the following table. This member can be used to implement the CTRL+LEFT ARROW and CTRL+RIGHT ARROW operations in editors.
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
     * The character is a valid position for showing the caret upon a word movement keyboard action. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character is not a valid position for showing the caret upon a word movement keyboard action.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fWordStop {
        get => (this._bitfield >> 3) & 0x1
        set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
    }

    /**
     * Value used to mark characters that form an invalid or undisplayable combination. Possible values are defined in the following table. A script that can set this member has the <b>fInvalidLogAttr</b> member set in its <a href="https://docs.microsoft.com/windows/desktop/api/usp10/ns-usp10-script_properties">SCRIPT_PROPERTIES</a> structure.
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
     * The character forms an invalid or undisplayable combination. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The character does not form an invalid or undisplayable combination.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fInvalid {
        get => (this._bitfield >> 4) & 0x1
        set => this._bitfield := ((value & 0x1) << 4) | (this._bitfield & ~(0x1 << 4))
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    fReserved {
        get => (this._bitfield >> 5) & 0x7
        set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
    }
}
