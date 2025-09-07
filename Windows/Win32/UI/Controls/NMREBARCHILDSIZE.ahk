#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information used in handling the RBN_CHILDSIZE notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmrebarchildsize
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMREBARCHILDSIZE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Zero-based index of the band affected by the notification. This will be -1 if no band is affected.
     * @type {Integer}
     */
    uBand {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Application-defined identifier of the band.
     * @type {Integer}
     */
    wID {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the new size of the child window. This member can be changed during the notification to modify the child window's position and size.
     * @type {RECT}
     */
    rcChild{
        get {
            if(!this.HasProp("__rcChild"))
                this.__rcChild := RECT(this.ptr + 32)
            return this.__rcChild
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the new size of the band.
     * @type {RECT}
     */
    rcBand{
        get {
            if(!this.HasProp("__rcBand"))
                this.__rcBand := RECT(this.ptr + 48)
            return this.__rcBand
        }
    }
}
