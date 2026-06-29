#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about a BCN_DROPDOWN notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmbcdropdown
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMBCDROPDOWN {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure containing information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the client area of the button.
     */
    rcButton : RECT

}
