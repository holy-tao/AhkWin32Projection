#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCRANGE.ahk" { WCRANGE }

/**
 * The GLYPHSET structure contains information about a range of Unicode code points.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-glyphset
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct GLYPHSET {
    #StructPack 4

    /**
     * The size, in bytes, of this structure.
     */
    cbThis : UInt32

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
     */
    flAccel : UInt32

    /**
     * The total number of Unicode code points supported in the font.
     */
    cGlyphsSupported : UInt32

    /**
     * The total number of Unicode ranges in <b>ranges</b>.
     */
    cRanges : UInt32

    /**
     * Array of Unicode ranges that are supported in the font.
     */
    ranges : WCRANGE[1]

}
