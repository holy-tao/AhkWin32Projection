#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NMLVEMPTYMARKUP_FLAGS.ahk" { NMLVEMPTYMARKUP_FLAGS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information used with the LVN_GETEMPTYMARKUP notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvemptymarkup
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMLVEMPTYMARKUP {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Info on the notification message.
     */
    hdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : NMLVEMPTYMARKUP_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>[L_MAX_URL_LENGTH]</b>
     * 
     * Markup to display.
     */
    szMarkup : WCHAR[2084]

}
