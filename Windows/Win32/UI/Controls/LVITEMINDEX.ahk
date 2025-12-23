#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains index information about a list-view item.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getitemindexrect">ListView_GetItemIndexRect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_getnextitemindex">ListView_GetNextItemIndex</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-listview_setitemindexstate">ListView_SetItemIndexState</a> macros. It is also used with the <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-getitemindexrect">LVM_GETITEMINDEXRECT</a>, <a href="https://docs.microsoft.com/windows/desktop/controls/lvm-getnextitemindex">LVM_GETNEXTITEMINDEX</a>, and <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-setitemindexstate">LVM_SETITEMINDEXSTATE</a> messages.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvitemindex
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVITEMINDEX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>int</b>
     * 
     * The index of the item.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of the group the item belongs to.
     * @type {Integer}
     */
    iGroup {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
