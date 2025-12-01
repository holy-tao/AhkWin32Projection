#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used with NM_TOOLTIPSCREATED notification codes.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtooltipscreated
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTOOLTIPSCREATED extends Win32Struct
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
                this.__hdr := NMHDR(0, this)
            return this.__hdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * The window handle to the tooltip control created.
     * @type {HWND}
     */
    hwndToolTips{
        get {
            if(!this.HasProp("__hwndToolTips"))
                this.__hwndToolTips := HWND(24, this)
            return this.__hwndToolTips
        }
    }
}
