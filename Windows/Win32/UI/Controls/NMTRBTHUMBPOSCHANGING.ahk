#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Contains information about a trackbar change notification. This message is sent with the TRBN_THUMBPOSCHANGING notification.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmtrbthumbposchanging
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTRBTHUMBPOSCHANGING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that describes the notification.
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
     * Type: <b>DWORD</b>
     * 
     * Position on trackbar.
     * @type {Integer}
     */
    dwPos {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    nReason {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
