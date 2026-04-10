#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk
#Include .\KERB_TICKET_CACHE_INFO_EX.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_QUERY_TKT_CACHE_EX_RESPONSE extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {KERB_PROTOCOL_MESSAGE_TYPE}
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
     * @type {KERB_TICKET_CACHE_INFO_EX}
     */
    Tickets {
        get {
            if(!this.HasProp("__TicketsProxyArray"))
                this.__TicketsProxyArray := Win32FixedArray(this.ptr + 8, 1, KERB_TICKET_CACHE_INFO_EX, "")
            return this.__TicketsProxyArray
        }
    }
}
