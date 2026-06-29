#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\LIST_ITEM_FLAGS.ahk" { LIST_ITEM_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\LITEM.ahk" { LITEM }
#Import ".\LIST_ITEM_STATE_FLAGS.ahk" { LIST_ITEM_STATE_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The NMLINK Contains notification information. Send this structure with the NM_CLICK or NM_RETURN messages.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlink
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLINK {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a> structure that contains information about the link item.
     */
    item : LITEM

}
