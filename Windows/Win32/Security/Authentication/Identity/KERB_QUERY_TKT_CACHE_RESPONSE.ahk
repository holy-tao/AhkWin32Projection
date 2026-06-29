#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_TICKET_FLAGS.ahk" { KERB_TICKET_FLAGS }
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import ".\KERB_TICKET_CACHE_INFO.ahk" { KERB_TICKET_CACHE_INFO }

/**
 * Contains the results of querying the ticket cache.
 * @remarks
 * This buffer is allocated by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Kerberos</a> authentication package and should be deleted by the application that called <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a>, using 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsafreereturnbuffer">LsaFreeReturnBuffer</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_query_tkt_cache_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_QUERY_TKT_CACHE_RESPONSE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_protocol_message_type">KERB_PROTOCOL_MESSAGE_TYPE</a> value identifying the type of request being made. This member must be set to <b>KerbQueryTicketCacheMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * Number of tickets in <b>Tickets</b> array. This can be zero if no tickets are available for the specified logon session.
     */
    CountOfTickets : UInt32

    /**
     * Array of length <b>CountOfTickets</b> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_cache_info">KERB_TICKET_CACHE_INFO</a> structures.
     */
    Tickets : KERB_TICKET_CACHE_INFO[1]

}
