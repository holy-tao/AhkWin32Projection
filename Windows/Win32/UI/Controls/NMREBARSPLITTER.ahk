#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information used to handle an RBN_SPLITTERDRAG notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmrebarsplitter
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMREBARSPLITTER extends Win32Struct
{
    static sizeof => 40

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
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that indicates the size the rebar will be after the drag operation completes.
     * @type {RECT}
     */
    rcSizing{
        get {
            if(!this.HasProp("__rcSizing"))
                this.__rcSizing := RECT(24, this)
            return this.__rcSizing
        }
    }
}
