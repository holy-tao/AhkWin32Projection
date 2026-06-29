#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LIST_VIEW_ITEM_STATE_FLAGS.ahk" { LIST_VIEW_ITEM_STATE_FLAGS }
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Structure that contains information for use in processing the LVN_ODSTATECHANGED notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvodstatechange
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVODSTATECHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the first item in the range of items.
     */
    iFrom : Int32

    /**
     * Type: <b>int</b>
     * 
     * Zero-based index of the last item in the range of items.
     */
    iTo : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value indicating the new state for the item or items. This member can be any valid combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">list-view item states</a>.
     */
    uNewState : LIST_VIEW_ITEM_STATE_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value indicating the old state for the item or items. This member can be any valid combination of the <a href="https://docs.microsoft.com/windows/desktop/Controls/list-view-item-states">list-view item states</a>.
     */
    uOldState : LIST_VIEW_ITEM_STATE_FLAGS

}
