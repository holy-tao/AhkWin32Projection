#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information used in handling the RBN_AUTOSIZE notification codes.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmrbautosize
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMRBAUTOSIZE extends Win32Struct
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * Member that indicates if the size or layout of the rebar control has changed (nonzero if a change occurred or zero otherwise).
     * @type {BOOL}
     */
    fChanged{
        get {
            if(!this.HasProp("__fChanged"))
                this.__fChanged := BOOL(this.ptr + 24)
            return this.__fChanged
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle to which the rebar control tried to size itself.
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(this.ptr + 32)
            return this.__rcTarget
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the rectangle to which the rebar control actually sized itself.
     * @type {RECT}
     */
    rcActual{
        get {
            if(!this.HasProp("__rcActual"))
                this.__rcActual := RECT(this.ptr + 48)
            return this.__rcActual
        }
    }
}
