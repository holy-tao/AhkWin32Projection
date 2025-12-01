#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets the vertical spacing between lines of text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_line_spacing
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_LINE_SPACING extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_line_spacing_method">DWRITE_LINE_SPACING_METHOD</a></b>
     * 
     * Method used to determine line spacing.
     * @type {Integer}
     */
    method {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * Spacing between lines. The interpretation of this parameter depends upon the line spacing method, as follows:
     * 
     * <ul>
     * <li>Line spacing: ignored</li>
     * <li>uniform line spacing: explicit distance in DIPs between lines</li>
     * <li>proportional line spacing: a scaling factor to be applied to the computed line height; 
     *        for each line, the height of the line is computed as for default line spacing, and the scaling factor is applied to that value.</li>
     * </ul>
     * @type {Float}
     */
    height {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * Distance from top of line to baseline. 
     *        The interpretation of this parameter depends upon the line spacing method, as follows:
     * 
     * <ul>
     * <li>default line spacing: ignored</li>
     * <li>uniform line spacing: explicit distance in DIPs from the top of the line to the baseline</li>
     * <li>proportional line spacing: a scaling factor applied to the computed baseline; for each line, 
     *        the baseline distance is computed as for default line spacing, and the scaling factor is applied to that value.</li>
     * </ul>
     * @type {Float}
     */
    baseline {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * Proportion of the entire leading distributed before the line. The allowed value is between 0 and 1.0. The remaining
     *      leading is distributed after the line. It is ignored for the default and uniform line spacing methods.
     *      The leading that is available to distribute before or after the line depends on the values of the height and
     *      baseline parameters.
     * @type {Float}
     */
    leadingBefore {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite_3/ne-dwrite_3-dwrite_font_line_gap_usage">DWRITE_FONT_LINE_GAP_USAGE</a></b>
     * 
     * Specify whether <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_metrics">DWRITE_FONT_METRICS</a>::lineGap value should be part of the line metrics.
     * @type {Integer}
     */
    fontLineGapUsage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
