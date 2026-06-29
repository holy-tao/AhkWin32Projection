#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_TICKET_FLAGS.ahk" { KERB_TICKET_FLAGS }

/**
 * Contains information about a cached Kerberos ticket. The Kerberos ticket is defined in Internet RFC 4120. For more information, see http://www.ietf.org.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_cache_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_TICKET_CACHE_INFO {
    #StructPack 8

    /**
     * A
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the server the ticket applies to. This name is combined with the <b>RealmName</b> value to create the full name <b>ServerName</b>@<b>RealmName</b>.
     */
    ServerName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the realm the ticket applies to.
     */
    RealmName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the ticket becomes valid. If the <b>starttime</b> member of the ticket is not set, this value defaults to the time when the ticket was initially authenticated, <b>authtime</b>. The <b>starttime</b> member of a ticket is optional.
     */
    StartTime : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time when the ticket expires.
     */
    EndTime : Int64

    /**
     * If KERB_TICKET_FLAGS_renewable is set in <b>TicketFlags</b>, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time beyond which the ticket cannot be renewed.
     */
    RenewTime : Int64

    /**
     * The type of encryption used in the ticket.
     */
    EncryptionType : Int32

    TicketFlags : KERB_TICKET_FLAGS

}
