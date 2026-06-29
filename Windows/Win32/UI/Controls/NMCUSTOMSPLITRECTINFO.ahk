#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about the two rectangles of a split button. Sent with the NM_GETCUSTOMSPLITRECT notification.
 * @remarks
 * This information is used to draw the button. The button must be of style <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_SPLITBUTTON</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_DEFSPLITBUTTON</a>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomsplitrectinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMCUSTOMSPLITRECTINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the client area the button occupies.
     */
    rcClient : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the rectangle that does not contain the drop-down arrow.
     */
    rcButton : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the rectangle that contains the drop-down arrow.
     */
    rcSplit : RECT

}
