#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\LIST_ITEM_FLAGS.ahk" { LIST_ITEM_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\LITEM.ahk" { LITEM }
#Import ".\LIST_ITEM_STATE_FLAGS.ahk" { LIST_ITEM_STATE_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about an LVN_LINKCLICK notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvlink
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVLINK {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains basic information about the notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a> structure that contains information about the link that was clicked.
     */
    link : LITEM

    /**
     * Type: <b>int</b>
     * 
     * Index of the item that contains the link.
     */
    iItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * Subitem, if any. This member may be <b>NULL</b>. For a link in a group header, this is the group identifier, as set in <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvgroup">LVGROUP</a>.
     */
    iSubItem : Int32

}
