#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_TICKET_CACHE_INFO_EX2.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_QUERY_TKT_CACHE_EX2_RESPONSE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CountOfTickets {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<KERB_TICKET_CACHE_INFO_EX2>}
     */
    Tickets{
        get {
            if(!this.HasProp("__TicketsProxyArray"))
                this.__TicketsProxyArray := Win32FixedArray(this.ptr + 8, 8, KERB_TICKET_CACHE_INFO_EX2, "")
            return this.__TicketsProxyArray
        }
    }
}
