#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WCRANGE.ahk

/**
 * The GLYPHSET structure contains information about a range of Unicode code points.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-glyphset
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GLYPHSET extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbThis {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags describing the maximum size of the glyph indices. This member can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>GS_8BIT_INDICES</td>
     * <td>Treat glyph indices as 8-bit wide values. Otherwise, they are 16-bit wide values.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    flAccel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The total number of Unicode code points supported in the font.
     * @type {Integer}
     */
    cGlyphsSupported {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of Unicode ranges in <b>ranges</b>.
     * @type {Integer}
     */
    cRanges {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Array of Unicode ranges that are supported in the font.
     * @type {Array<WCRANGE>}
     */
    ranges{
        get {
            if(!this.HasProp("__rangesProxyArray"))
                this.__rangesProxyArray := Win32FixedArray(this.ptr + 16, 1, WCRANGE, "")
            return this.__rangesProxyArray
        }
    }
}
