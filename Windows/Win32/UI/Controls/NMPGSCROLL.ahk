#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains and receives information that the pager control uses when scrolling the contained window. It is used with the PGN_SCROLL notification.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmpgscroll
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMPGSCROLL extends Win32Struct
{
    static sizeof => 58

    static packingSize => 1

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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * @type {Integer}
     */
    fwKeys {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Contains the client rectangle of the pager control.
     * @type {RECT}
     */
    rcParent{
        get {
            if(!this.HasProp("__rcParent"))
                this.__rcParent := RECT(this.ptr + 26)
            return this.__rcParent
        }
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    iDir {
        get => NumGet(this, 42, "int")
        set => NumPut("int", value, this, 42)
    }

    /**
     * Type: <b>int</b>
     * 
     * Contains the horizontal scroll position of the contained window, in pixels, before the scroll action.
     * @type {Integer}
     */
    iXpos {
        get => NumGet(this, 46, "int")
        set => NumPut("int", value, this, 46)
    }

    /**
     * Type: <b>int</b>
     * 
     * Contains the vertical scroll position of the contained window, in pixels, before the scroll action.
     * @type {Integer}
     */
    iYpos {
        get => NumGet(this, 50, "int")
        set => NumPut("int", value, this, 50)
    }

    /**
     * Type: <b>int</b>
     * 
     * On entry, contains the default scroll delta in pixels. This member can be modified to contain a different scroll delta amount if desired. This value is always positive, regardless of the scroll direction.
     * @type {Integer}
     */
    iScroll {
        get => NumGet(this, 54, "int")
        set => NumPut("int", value, this, 54)
    }
}
