#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Provides information about a scrolling operation.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmlvscroll
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVSCROLL extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about a <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-endscroll">LVN_ENDSCROLL</a> or a <a href="https://docs.microsoft.com/windows/desktop/Controls/lvn-beginscroll">LVN_BEGINSCROLL</a> notification code.
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
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that specifies in pixels the horizontal position where a scrolling operation should begin or end.
     * @type {Integer}
     */
    dx {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that specifies in pixels the vertical position where a scrolling operation should begin or end.
     * @type {Integer}
     */
    dy {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
