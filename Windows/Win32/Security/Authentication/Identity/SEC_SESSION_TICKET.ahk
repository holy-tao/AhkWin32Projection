#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_SESSION_TICKET extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    SessionTicketSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    SessionTicket{
        get {
            if(!this.HasProp("__SessionTicketProxyArray"))
                this.__SessionTicketProxyArray := Win32FixedArray(this.ptr + 2, 1, Primitive, "char")
            return this.__SessionTicketProxyArray
        }
    }
}
