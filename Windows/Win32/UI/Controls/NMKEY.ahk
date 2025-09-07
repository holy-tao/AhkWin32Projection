#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used with key notification messages.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmkey
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMKEY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about this notification.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A virtual key code of the key that caused the event.
     * @type {Integer}
     */
    nVKey {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flags associated with the key. These are the same flags that are passed in the high word of the 
     * 					<i>lParam</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a> message.
     * @type {Integer}
     */
    uFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
