#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information about a trackbar change notification. This message is sent with the TRBN_THUMBPOSCHANGING notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtrbthumbposchanging
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTRBTHUMBPOSCHANGING {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that describes the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b>DWORD</b>
     * 
     * Position on trackbar.
     */
    dwPos : UInt32

    /**
     * Type: <b>int</b>
     */
    nReason : Int32

}
