#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\LIST_VIEW_ITEM_FLAGS.ahk" { LIST_VIEW_ITEM_FLAGS }

/**
 * Contains information about a list-view notification message. This structure is the same as the NM_LISTVIEW structure but has been renamed to fit standard naming conventions.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlistview
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLISTVIEW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification message.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Identifies the list-view item, or -1 if not used.
     */
    iItem : Int32

    /**
     * Type: <b>int</b>
     * 
     * Identifies the subitem, or zero if none.
     */
    iSubItem : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * New item state. This member is zero for notification messages that do not use it. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">List-View Item States</a>.
     */
    uNewState : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Old item state. This member is zero for notification messages that do not use it. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">List-View Item States</a>.
     */
    uOldState : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Set of flags that indicate the item attributes that have changed. This member is zero for notifications that do not use it. Otherwise, it can have the same values as the 
     * 					<b>mask</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvitema">LVITEM</a> structure.
     */
    uChanged : LIST_VIEW_ITEM_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that indicates the location at which the event occurred. This member is undefined for notification messages that do not use it.
     */
    ptAction : POINT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Application-defined value of the item. This member is undefined for notification messages that do not use it.
     */
    lParam : LPARAM

}
