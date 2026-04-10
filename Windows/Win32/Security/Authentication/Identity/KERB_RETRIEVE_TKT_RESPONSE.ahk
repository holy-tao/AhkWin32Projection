#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_EXTERNAL_TICKET.ahk
#Include .\KERB_EXTERNAL_NAME.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_CRYPTO_KEY.ahk
#Include .\KERB_CRYPTO_KEY_TYPE.ahk
#Include .\KERB_TICKET_FLAGS.ahk

/**
 * Contains the response from retrieving a ticket.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_retrieve_tkt_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_RETRIEVE_TKT_RESPONSE extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_ticket">KERB_EXTERNAL_TICKET</a> structure containing the requested ticket.
     * @type {KERB_EXTERNAL_TICKET}
     */
    Ticket {
        get {
            if(!this.HasProp("__Ticket"))
                this.__Ticket := KERB_EXTERNAL_TICKET(0, this)
            return this.__Ticket
        }
    }
}
