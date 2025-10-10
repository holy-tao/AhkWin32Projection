#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information about a BCN_DROPDOWN notification.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmbcdropdown
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMBCDROPDOWN extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure containing information about the notification.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the client area of the button.
     * @type {RECT}
     */
    rcButton{
        get {
            if(!this.HasProp("__rcButton"))
                this.__rcButton := RECT(this.ptr + 24)
            return this.__rcButton
        }
    }
}
