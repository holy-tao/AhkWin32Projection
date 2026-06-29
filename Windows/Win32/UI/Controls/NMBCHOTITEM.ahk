#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMTBHOTITEM_FLAGS.ahk" { NMTBHOTITEM_FLAGS }

/**
 * Contains information about the movement of the mouse over a button control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmbchotitem
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMBCHOTITEM {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : NMTBHOTITEM_FLAGS

}
