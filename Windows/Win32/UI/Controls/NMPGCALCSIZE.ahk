#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import ".\NMPGCALCSIZE_FLAGS.ahk" { NMPGCALCSIZE_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains and receives information that the pager control uses to calculate the scrollable area of the contained window. It is used with the PGN_CALCSIZE notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmpgcalcsize
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMPGCALCSIZE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlag : NMPGCALCSIZE_FLAGS

    /**
     * Type: <b>int</b>
     * 
     * Receives the desired width of the scrollable area, in pixels.
     */
    iWidth : Int32

    /**
     * Type: <b>int</b>
     * 
     * Receives the desired height of the scrollable area, in pixels.
     */
    iHeight : Int32

}
