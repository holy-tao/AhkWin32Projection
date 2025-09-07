#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

/**
 * Contains information for the IPN_FIELDCHANGED notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmipaddress
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMIPADDRESS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains additional information about the notification.
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
     * The zero-based number of the field that was changed.
     * @type {Integer}
     */
    iField {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * The new value of the field specified in the 
     * 					<b>iField</b> member. While processing the <a href="https://docs.microsoft.com/windows/desktop/Controls/ipn-fieldchanged">IPN_FIELDCHANGED</a> notification, this member can be set to any value that is within the range of the field and the control will place this new value in the field.
     * @type {Integer}
     */
    iValue {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
