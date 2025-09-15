#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Contains information about a key press in a tab control. It is used with the TCN_KEYDOWN notification code. This structure supersedes the TC_KEYDOWN structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtckeydown
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTCKEYDOWN extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * Virtual key code.
     * @type {Integer}
     */
    wVKey {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Value that is identical to the 
     * 					<i>lParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> message.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
