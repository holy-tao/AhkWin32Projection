#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import ".\RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE.ahk" { RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CHARRANGE.ahk" { CHARRANGE }

/**
 * Contains information associated with an EN_SELCHANGE notification code. A rich edit control sends this notification to its parent window when the current selection changes.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-selchange
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct SELCHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Notification header.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * New selection range.
     */
    chrg : CHARRANGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     */
    seltyp : RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE

}
