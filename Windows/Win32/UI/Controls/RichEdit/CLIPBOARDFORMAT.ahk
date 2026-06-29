#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }

/**
 * Specifies the clipboard format. This structure included with the EN_CLIPFORMAT notification.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-clipboardformat
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct CLIPBOARDFORMAT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Structure that contains information about this notification message.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A clipboard format registered by a call to the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-registerclipboardformata">RegisterClipboardFormat</a> function.
     */
    cf : UInt16

}
