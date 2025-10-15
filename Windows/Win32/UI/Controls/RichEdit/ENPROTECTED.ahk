#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk
#Include ..\..\..\Foundation\WPARAM.ahk
#Include ..\..\..\Foundation\LPARAM.ahk
#Include .\CHARRANGE.ahk

/**
 * Contains information associated with an EN_PROTECTED notification code. A rich edit control sends this notification when the user attempts to edit protected text.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-enprotected
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class ENPROTECTED extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> notification header.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Message that triggered the notification.
     * @type {Integer}
     */
    msg {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The <b>wParam</b> parameter of the message.
     * @type {WPARAM}
     */
    wParam{
        get {
            if(!this.HasProp("__wParam"))
                this.__wParam := WPARAM(this.ptr + 32)
            return this.__wParam
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * The <b>lParam</b> parameter of the message.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 40)
            return this.__lParam
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The current selection.
     * @type {CHARRANGE}
     */
    chrg{
        get {
            if(!this.HasProp("__chrg"))
                this.__chrg := CHARRANGE(this.ptr + 48)
            return this.__chrg
        }
    }
}
