#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains definitions of the tab positions for ScriptStringAnalyse.
 * @remarks
 * This structure is ignored unless the <i>dwFlags</i> parameter is set to SSA_TAB in the       <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptstringanalyse">ScriptStringAnalyse</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_tabdef
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_TABDEF {
    #StructPack 8

    /**
     * Number of entries in the array indicated by <b>pTabStops</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Tab stops occur every eight average character widths.</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>All tab stops are the length of the first entry in the array indicated by <b>pTabStops</b>.</td>
     * </tr>
     * <tr>
     * <td>greater than 1</td>
     * <td>The first <b>cTabStops</b> tab stops are as specified in the array indicated by <b>pTabStops</b>, and subsequent tab stops are every eight average characters.</td>
     * </tr>
     * </table>
     */
    cTabStops : Int32

    /**
     * Scale factor for <b>iTabOrigin</b> and <b>pTabStops</b> values. Values are converted to device coordinates by multiplying by the value indicated by <b>iScale</b>, then dividing by 4. If values are already in device units, set <b>iScale</b> to 4. If values are in dialog units, set <b>iScale</b> to the average character width of the dialog font. If values are multiples of the average character width for the selected font, set <b>iScale</b> to 0.
     */
    iScale : Int32

    /**
     * Pointer to an array having the number of entries indicated by <b>cTabStops</b>. Each entry specifies a tab stop position. Positive values represent near-edge alignment, while negative values represent far-edge alignment. The units for the array elements are as indicated by the value of <b>iScale</b>.
     */
    pTabStops : IntPtr

    /**
     * Initial offset, in logical units, for tab stops. Tabs start <b>iTabOrigin</b> logical units before the beginning of the string. This rule helps with situations in which multiple tabbed outputs occur on the same line.
     */
    iTabOrigin : Int32

}
