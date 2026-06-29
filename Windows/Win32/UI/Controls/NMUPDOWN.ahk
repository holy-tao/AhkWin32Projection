#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information specific to up-down control notification messages. It is identical to and replaces the NM_UPDOWN structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmupdown
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMUPDOWN {
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
     * Signed integer value that represents the up-down control's current position.
     */
    iPos : Int32

    /**
     * Type: <b>int</b>
     * 
     * Signed integer value that represents the proposed change in the up-down control's position.
     */
    iDelta : Int32

}
