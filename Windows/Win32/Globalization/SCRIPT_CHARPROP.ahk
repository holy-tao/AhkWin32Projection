#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information about a single character in a run (input string). The information indicates if the character glyph is affected by surrounding letters of the run.
 * @remarks
 * 
 * One or more characters in a run, immediately preceding and/or following the letter being shaped, can influence shaping. Information about these characters can help optimize higher-level layout code, such as that used to optimize paragraph layout.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-script_charprop
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_CHARPROP extends Win32Struct
{
    static sizeof => 2

    static packingSize => 2

    /**
     * This bitfield backs the following members:
     * - fCanGlyphAlone
     * - reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Value indicating if the shaping of a letter depends on other characters around the letter being shaped. Possible values are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TRUE</td>
     * <td>The shape of a letter is independent of surrounding characters.</td>
     * </tr>
     * <tr>
     * <td>FALSE</td>
     * <td>The shape of a letter depends on one or more adjacent characters.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fCanGlyphAlone {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    reserved {
        get => (this._bitfield >> 1) & 0x7FFF
        set => this._bitfield := ((value & 0x7FFF) << 1) | (this._bitfield & ~(0x7FFF << 1))
    }
}
