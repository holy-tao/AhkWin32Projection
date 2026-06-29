#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information used in processing the LVN_KEYDOWN notification code. This structure is the same as the NMLVKEYDOWN structure but has been renamed to fit standard naming conventions.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvkeydown
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVKEYDOWN {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual key code</a>.
     */
    wVKey : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This member must always be zero.
     */
    flags : UInt32

}
