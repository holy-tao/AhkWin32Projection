#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMPGSCROLL_KEYS.ahk" { NMPGSCROLL_KEYS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMPGSCROLL_DIR.ahk" { NMPGSCROLL_DIR }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains and receives information that the pager control uses when scrolling the contained window. It is used with the PGN_SCROLL notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmpgscroll
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMPGSCROLL {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     */
    fwKeys : NMPGSCROLL_KEYS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Contains the client rectangle of the pager control.
     */
    rcParent : RECT

    /**
     * Type: <b>int</b>
     */
    iDir : NMPGSCROLL_DIR

    /**
     * Type: <b>int</b>
     * 
     * Contains the horizontal scroll position of the contained window, in pixels, before the scroll action.
     */
    iXpos : Int32

    /**
     * Type: <b>int</b>
     * 
     * Contains the vertical scroll position of the contained window, in pixels, before the scroll action.
     */
    iYpos : Int32

    /**
     * Type: <b>int</b>
     * 
     * On entry, contains the default scroll delta in pixels. This member can be modified to contain a different scroll delta amount if desired. This value is always positive, regardless of the scroll direction.
     */
    iScroll : Int32

}
