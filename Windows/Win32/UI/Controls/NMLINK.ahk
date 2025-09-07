#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include .\LITEM.ahk

/**
 * The NMLINK Contains notification information. Send this structure with the NM_CLICK or NM_RETURN messages.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlink
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLINK extends Win32Struct
{
    static sizeof => 4304

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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-litem">LITEM</a> structure that contains information about the link item.
     * @type {LITEM}
     */
    item{
        get {
            if(!this.HasProp("__item"))
                this.__item := LITEM(this.ptr + 24)
            return this.__item
        }
    }
}
