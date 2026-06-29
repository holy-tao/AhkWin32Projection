#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to describe insertion points.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvinsertmark
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVINSERTMARK {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVINSERTMARK</b> structure.
     */
    cbSize : UInt32 := this.Size

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
     */
    dwFlags : UInt32

    /**
     * Type: <b>int</b>
     * 
     * Item next to which the insertion point appears. If this member contains -1, there is no insertion point.
     */
    iItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwReserved : UInt32

}
