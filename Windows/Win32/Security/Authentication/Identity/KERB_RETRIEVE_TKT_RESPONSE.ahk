#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_EXTERNAL_NAME.ahk" { KERB_EXTERNAL_NAME }
#Import ".\KERB_EXTERNAL_TICKET.ahk" { KERB_EXTERNAL_TICKET }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_CRYPTO_KEY_TYPE.ahk" { KERB_CRYPTO_KEY_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_TICKET_FLAGS.ahk" { KERB_TICKET_FLAGS }
#Import ".\KERB_CRYPTO_KEY.ahk" { KERB_CRYPTO_KEY }

/**
 * Contains the response from retrieving a ticket.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_retrieve_tkt_response
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_RETRIEVE_TKT_RESPONSE {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_ticket">KERB_EXTERNAL_TICKET</a> structure containing the requested ticket.
     */
    Ticket : KERB_EXTERNAL_TICKET

}
