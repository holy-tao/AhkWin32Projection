#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk

/**
 * Contains information used to update the cached item information for use with a virtual list view.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmlvcachehint
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVCACHEHINT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification message.
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
     * Type: <b>int</b>
     * 
     * Starting index of the requested range of items. This value is inclusive.
     * @type {Integer}
     */
    iFrom {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Ending index of the requested range of items. This value is inclusive.
     * @type {Integer}
     */
    iTo {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
