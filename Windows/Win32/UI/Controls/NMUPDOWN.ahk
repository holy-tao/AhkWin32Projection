#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Contains information specific to up-down control notification messages. It is identical to and replaces the NM_UPDOWN structure.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmupdown
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMUPDOWN extends Win32Struct
{
    static sizeof => 32

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
     * Type: <b>int</b>
     * 
     * Signed integer value that represents the up-down control's current position.
     * @type {Integer}
     */
    iPos {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * Signed integer value that represents the proposed change in the up-down control's position.
     * @type {Integer}
     */
    iDelta {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
