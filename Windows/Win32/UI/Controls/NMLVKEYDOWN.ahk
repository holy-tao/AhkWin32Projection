#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used in processing the LVN_KEYDOWN notification code. This structure is the same as the NMLVKEYDOWN structure but has been renamed to fit standard naming conventions.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvkeydown
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVKEYDOWN extends Win32Struct
{
    static sizeof => 30

    static packingSize => 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
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
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/inputdev/virtual-key-codes">Virtual key code</a>.
     * @type {Integer}
     */
    wVKey {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This member must always be zero.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 26, "uint")
        set => NumPut("uint", value, this, 26)
    }
}
