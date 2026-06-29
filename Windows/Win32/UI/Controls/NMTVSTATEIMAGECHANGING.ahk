#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\HTREEITEM.ahk" { HTREEITEM }

/**
 * Contains information about an NM_TVSTATEIMAGECHANGING notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvstateimagechanging
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTVSTATEIMAGECHANGING {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
     */
    hdr : NMHDR

    /**
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the tree-view item whose state image is changing.
     */
    hti : HTREEITEM

    /**
     * Type: <b>int</b>
     * 
     * The index of the old state image.
     */
    iOldStateImageIndex : Int32

    /**
     * Type: <b>int</b>
     * 
     * The index of the new state image.
     */
    iNewStateImageIndex : Int32

}
