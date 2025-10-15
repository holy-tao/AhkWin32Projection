#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\Foundation\BOOL.ahk

/**
 * Contains information associated with an EN_DROPFILES notification code. A rich edit control sends this notification code when it receives a WM_DROPFILES message.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-endropfiles
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENDROPFILES extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Notification header.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HANDLE</a></b>
     * 
     * Handle to the dropped files list (same as with <a href="https://docs.microsoft.com/windows/desktop/shell/wm-dropfiles">WM_DROPFILES</a> ). This handle is used with the <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-dragfinish">DragFinish</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-dragqueryfilea">DragQueryFile</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shellapi/nf-shellapi-dragquerypoint">DragQueryPoint</a> functions.
     * @type {HANDLE}
     */
    hDrop{
        get {
            if(!this.HasProp("__hDrop"))
                this.__hDrop := HANDLE(this.ptr + 24)
            return this.__hDrop
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Character position at which the dropped files would be inserted.
     * @type {Integer}
     */
    cp {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Indicates whether the specified character position is protected (<b>TRUE</b>) or not protected (<b>FALSE</b>).
     * @type {BOOL}
     */
    fProtected{
        get {
            if(!this.HasProp("__fProtected"))
                this.__fProtected := BOOL(this.ptr + 36)
            return this.__fProtected
        }
    }
}
