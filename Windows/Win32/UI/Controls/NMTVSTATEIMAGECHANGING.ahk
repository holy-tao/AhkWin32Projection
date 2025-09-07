#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information about an NM_TVSTATEIMAGECHANGING notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmtvstateimagechanging
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMTVSTATEIMAGECHANGING extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
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
     * Type: <b>HTREEITEM</b>
     * 
     * Handle to the tree-view item whose state image is changing.
     * @type {Pointer}
     */
    hti {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of the old state image.
     * @type {Integer}
     */
    iOldStateImageIndex {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b>int</b>
     * 
     * The index of the new state image.
     * @type {Integer}
     */
    iNewStateImageIndex {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
