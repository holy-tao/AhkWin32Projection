#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains index information about a list-view item.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getitemindexrect">ListView_GetItemIndexRect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getnextitemindex">ListView_GetNextItemIndex</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_setitemindexstate">ListView_SetItemIndexState</a> macros. It is also used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getitemindexrect">LVM_GETITEMINDEXRECT</a>, <a href="https://docs.microsoft.com/windows/desktop/controls/lvm-getnextitemindex">LVM_GETNEXTITEMINDEX</a>, and <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-setitemindexstate">LVM_SETITEMINDEXSTATE</a> messages.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvitemindex
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVITEMINDEX {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * The index of the item.
     */
    iItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * The index of the group the item belongs to.
     */
    iGroup : Int32

}
