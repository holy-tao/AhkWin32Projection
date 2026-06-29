#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import ".\RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE.ahk" { RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CHARRANGE.ahk" { CHARRANGE }

/**
 * Contains information about the selected text to be corrected.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-encorrecttext
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct ENCORRECTTEXT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure. The <b>code</b> member of this structure identifies the notification code being sent.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a> structure that specifies the range of selected characters.
     */
    chrg : CHARRANGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     */
    seltyp : RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE

}
