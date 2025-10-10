#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains definitions of the tab positions for ScriptStringAnalyse.
 * @remarks
 * 
  * This structure is ignored unless the <i>dwFlags</i> parameter is set to SSA_TAB in the       <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptstringanalyse">ScriptStringAnalyse</a> function.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//usp10/ns-usp10-script_tabdef
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_TABDEF extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    cTabStops {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Scale factor for <b>iTabOrigin</b> and <b>pTabStops</b> values. Values are converted to device coordinates by multiplying by the value indicated by <b>iScale</b>, then dividing by 4. If values are already in device units, set <b>iScale</b> to 4. If values are in dialog units, set <b>iScale</b> to the average character width of the dialog font. If values are multiples of the average character width for the selected font, set <b>iScale</b> to 0.
     * @type {Integer}
     */
    iScale {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Pointer to an array having the number of entries indicated by <b>cTabStops</b>. Each entry specifies a tab stop position. Positive values represent near-edge alignment, while negative values represent far-edge alignment. The units for the array elements are as indicated by the value of <b>iScale</b>.
     * @type {Pointer<Int32>}
     */
    pTabStops {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initial offset, in logical units, for tab stops. Tabs start <b>iTabOrigin</b> logical units before the beginning of the string. This rule helps with situations in which multiple tabbed outputs occur on the same line.
     * @type {Integer}
     */
    iTabOrigin {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
