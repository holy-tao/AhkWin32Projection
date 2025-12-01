#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information about the two rectangles of a split button. Sent with the NM_GETCUSTOMSPLITRECT notification.
 * @remarks
 * This information is used to draw the button. The button must be of style <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_SPLITBUTTON</a> or <a href="https://docs.microsoft.com/windows/desktop/Controls/button-styles">BS_DEFSPLITBUTTON</a>
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmcustomsplitrectinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMCUSTOMSPLITRECTINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the client area the button occupies.
     * @type {RECT}
     */
    rcClient{
        get {
            if(!this.HasProp("__rcClient"))
                this.__rcClient := RECT(24, this)
            return this.__rcClient
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the rectangle that does not contain the drop-down arrow.
     * @type {RECT}
     */
    rcButton{
        get {
            if(!this.HasProp("__rcButton"))
                this.__rcButton := RECT(40, this)
            return this.__rcButton
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that describes the rectangle that contains the drop-down arrow.
     * @type {RECT}
     */
    rcSplit{
        get {
            if(!this.HasProp("__rcSplit"))
                this.__rcSplit := RECT(56, this)
            return this.__rcSplit
        }
    }
}
