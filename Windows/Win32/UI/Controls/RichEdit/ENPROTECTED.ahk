#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import ".\CHARRANGE.ahk" { CHARRANGE }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Contains information associated with an EN_PROTECTED notification code. A rich edit control sends this notification when the user attempts to edit protected text.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-enprotected
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct ENPROTECTED {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> notification header.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a></b>
     * 
     * Message that triggered the notification.
     */
    msg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The <b>wParam</b> parameter of the message.
     */
    wParam : WPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The <b>lParam</b> parameter of the message.
     */
    lParam : LPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The current selection.
     */
    chrg : CHARRANGE

}
