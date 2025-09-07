#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DWRITE_SCRIPT_PROPERTIES structure specifies script properties for caret navigation and justification.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_1/ns-dwrite_1-dwrite_script_properties
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_SCRIPT_PROPERTIES extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The standardized four character code for the given script. 
     * 
     * <div class="alert"><b>Note</b>  These only include the general Unicode scripts, not any additional <a href="http://unicode.org/iso15924/iso15924-codes.html">ISO 15924</a> scripts for bibliographic distinction.</div>
     * <div> </div>
     * @type {Integer}
     */
    isoScriptCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The standardized numeric code, ranging 0-999.
     * @type {Integer}
     */
    isoScriptNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Number of characters to estimate look-ahead for complex scripts. Latin and all Kana are generally 1. Indic scripts are up to 15, and most others are 8.
     * 
     * <div class="alert"><b>Note</b>  Combining marks and variation selectors can produce clusters that are longer than these look-aheads, so this estimate is considered typical language use. Diacritics must be tested explicitly separately.</div>
     * <div> </div>
     * @type {Integer}
     */
    clusterLookahead {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Appropriate character to elongate the given script for justification. For example:
     * 
     * <ul>
     * <li>Arabic    - U+0640 Tatweel</li>
     * <li>Ogham     - U+1680 Ogham Space Mark</li>
     * </ul>
     * @type {Integer}
     */
    justificationCharacter {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
