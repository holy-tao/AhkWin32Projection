#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CHARRANGE.ahk" { CHARRANGE }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Contains information about an EN_LINK notification code from a rich edit control.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-enlink
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct ENLINK {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The code member of this structure identifies the notification code being sent.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifier of the message that caused the rich edit control to send the <a href="https://msdn.microsoft.com/67f02908-957e-4d91-8a70-70399ce9cf2e">EN_LINK</a> notification code.
     */
    msg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The <b>wParam</b> parameter of the message received by the rich edit control.
     */
    wParam : WPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The <b>lParam</b> parameter of the message received by the rich edit control.
     */
    lParam : LPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of consecutive characters in the rich edit control that have the CFE_LINK effect.
     */
    chrg : CHARRANGE

}
