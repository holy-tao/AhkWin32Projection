#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_PROTOCOL_MESSAGE_TYPE.ahk
#Include .\KERB_TICKET_CACHE_INFO.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_TICKET_FLAGS.ahk

/**
 * Contains the results of querying the ticket cache.
 * @remarks
 * This buffer is allocated by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package and should be deleted by the application that called <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a>, using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_tkt_cache_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_QUERY_TKT_CACHE_RESPONSE extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member must be set to <b>KerbQueryTicketCacheMessage</b>.
     * @type {KERB_PROTOCOL_MESSAGE_TYPE}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Number of tickets in <b>Tickets</b> array. This can be zero if no tickets are available for the specified logon session.
     * @type {Integer}
     */
    CountOfTickets {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Array of length <b>CountOfTickets</b> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_cache_info">KERB_TICKET_CACHE_INFO</a> structures.
     * @type {KERB_TICKET_CACHE_INFO}
     */
    Tickets {
        get {
            if(!this.HasProp("__TicketsProxyArray"))
                this.__TicketsProxyArray := Win32FixedArray(this.ptr + 8, 1, KERB_TICKET_CACHE_INFO, "")
            return this.__TicketsProxyArray
        }
    }
}
