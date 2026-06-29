#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains information about a keyboard event in a tree-view control. This structure is used with the TVN_KEYDOWN notification code. The structure is identical to the TV_KEYDOWN structure, but it has been renamed to follow current naming conventions.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvkeydown
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMTVKEYDOWN {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Virtual key code.
     */
    wVKey : UInt16

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Always zero.
     */
    flags : UInt32

}
