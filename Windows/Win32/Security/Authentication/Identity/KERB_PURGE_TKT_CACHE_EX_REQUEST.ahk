#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_TICKET_CACHE_INFO_EX.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_PURGE_TKT_CACHE_EX_REQUEST extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 8)
            return this.__LogonId
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {KERB_TICKET_CACHE_INFO_EX}
     */
    TicketTemplate{
        get {
            if(!this.HasProp("__TicketTemplate"))
                this.__TicketTemplate := KERB_TICKET_CACHE_INFO_EX(this.ptr + 24)
            return this.__TicketTemplate
        }
    }
}
