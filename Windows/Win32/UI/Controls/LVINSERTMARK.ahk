#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to describe insertion points.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvinsertmark
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVINSERTMARK extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVINSERTMARK</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flag that specifies where the insertion point should appear. Use the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LVIM_AFTER"></a><a id="lvim_after"></a><dl>
     * <dt><b>LVIM_AFTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The insertion point appears after the item specified if the LVIM_AFTER flag is set; otherwise it appears before the specified item.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * Item next to which the insertion point appears. If this member contains -1, there is no insertion point.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
