#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\NMHDR.ahk" { NMHDR }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information associated with an EN_DROPFILES notification code. A rich edit control sends this notification code when it receives a WM_DROPFILES message.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-endropfiles
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @architecture X64, Arm64
 */
export default struct ENDROPFILES {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Notification header.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * Handle to the dropped files list (same as with <a href="https://docs.microsoft.com/windows/desktop/shell/wm-dropfiles">WM_DROPFILES</a> ). This handle is used with the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-dragfinish">DragFinish</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-dragqueryfilea">DragQueryFile</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-dragquerypoint">DragQueryPoint</a> functions.
     */
    hDrop : HANDLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position at which the dropped files would be inserted.
     */
    cp : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether the specified character position is protected (<b>TRUE</b>) or not protected (<b>FALSE</b>).
     */
    fProtected : BOOL

}
