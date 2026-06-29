#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Provides information about an item in a list-view control when it is displayed in tile view.
 * @remarks
 * In tile view, the item name is displayed to the right of the icon. You can specify additional subitems (corresponding to columns in the details view), to be displayed on lines below the item name. The <b>puColumns</b> array contains the indices of subitems to be displayed. Indices should be greater than 0, because subitem 0, the item name, is already displayed.
 * 
 * Column information can also be set in the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure when creating the list item.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvtileinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVTILEINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the <b>LVTILEINFO</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>int</b>
     * 
     * The item for which the information is retrieved or set.
     */
    iItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of data columns displayed for this item. When retrieving information, initialize this value to the size of the <b>puColumns</b> array. On return, the member is set to the number of columns actually set for the item.
     */
    cColumns : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PUINT</a></b>
     * 
     * A pointer to an array of column indices, specifying which columns are displayed for this item, and the order of those columns. When retrieving information, allocate an array large enough to hold the greatest number of columns expected.
     */
    puColumns : IntPtr

    /**
     * Type: <b>int*</b>
     * 
     * A pointer to an array of column formats (for example, LVCFMT_LEFT), one for each of the columns specified in <b>puColumns</b>. When retrieving information, allocate an array large enough to hold the greatest number of column formats expected.
     */
    piColFmt : IntPtr

}
