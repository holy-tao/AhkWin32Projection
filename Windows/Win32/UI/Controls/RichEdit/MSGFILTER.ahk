#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk
#Include ..\..\..\Foundation\WPARAM.ahk
#Include ..\..\..\Foundation\LPARAM.ahk

/**
 * Contains information about a keyboard or mouse event. A rich edit control sends this structure to its parent window as part of an EN_MSGFILTER notification code, enabling the parent to change the message or prevent it from being processed.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-msgfilter
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class MSGFILTER extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure is the <a href="https://msdn.microsoft.com/96cf0047-baae-46cd-82e8-ab6f3f353260">EN_MSGFILTER</a> notification code that identifies the message being sent.
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
     * Keyboard or mouse message identifier.
     * @type {Integer}
     */
    msg {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WPARAM</a></b>
     * 
     * The 
     * 					<b>wParam</b> parameter of the message.
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
     * The 
     * 					<b>lParam</b> parameter of the message.
     * @type {LPARAM}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := LPARAM(this.ptr + 40)
            return this.__lParam
        }
    }
}
