#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Contains information about a keyboard or mouse event. A rich edit control sends this structure to its parent window as part of an EN_MSGFILTER notification code, enabling the parent to change the message or prevent it from being processed.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-msgfilter
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct MSGFILTER {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure is the <a href="https://msdn.microsoft.com/96cf0047-baae-46cd-82e8-ab6f3f353260">EN_MSGFILTER</a> notification code that identifies the message being sent.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Keyboard or mouse message identifier.
     */
    msg : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The 
     * 					<b>wParam</b> parameter of the message.
     */
    wParam : WPARAM

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The 
     * 					<b>lParam</b> parameter of the message.
     */
    lParam : LPARAM

}
