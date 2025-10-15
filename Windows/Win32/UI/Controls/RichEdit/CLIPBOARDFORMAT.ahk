#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk

/**
 * Specifies the clipboard format. This structure included with the EN_CLIPFORMAT notification.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-clipboardformat
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class CLIPBOARDFORMAT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * Structure that contains information about this notification message.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A clipboard format registered by a call to the <a href="https://docs.microsoft.com/windows/win32/api/winuser/nf-winuser-registerclipboardformata">RegisterClipboardFormat</a> function.
     * @type {Integer}
     */
    cf {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }
}
