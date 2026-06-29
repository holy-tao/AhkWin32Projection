#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_EXTERNAL_NAME.ahk" { KERB_EXTERNAL_NAME }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_CRYPTO_KEY_TYPE.ahk" { KERB_CRYPTO_KEY_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\KERB_TICKET_FLAGS.ahk" { KERB_TICKET_FLAGS }
#Import ".\KERB_CRYPTO_KEY.ahk" { KERB_CRYPTO_KEY }

/**
 * Contains information about an external ticket.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_external_ticket
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_EXTERNAL_TICKET {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_name">KERB_EXTERNAL_NAME</a> structure that contains a multiple part, canonical, returned service name.
     */
    ServiceName : KERB_EXTERNAL_NAME.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_name">KERB_EXTERNAL_NAME</a> structure that contains the multiple part <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">service principal name</a> (SPN).
     */
    TargetName : KERB_EXTERNAL_NAME.Ptr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_name">KERB_EXTERNAL_NAME</a> structure that contains the client name in the ticket. This name is relative to the current domain.
     */
    ClientName : KERB_EXTERNAL_NAME.Ptr

    /**
     * A
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the domain that corresponds to the <b>ServiceName</b> member. This is the domain that issued the ticket.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the domain in which the ticket is valid. For an interdomain ticket, this is the destination domain.
     */
    TargetDomainName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains a synonym for the destination domain. Every domain has two names: a DNS name and a NetBIOS name. If the name returned in the ticket is different from the name used to request the ticket (the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Key Distribution Center</a> (KDC) may do name mapping), this string contains the original name.
     */
    AltTargetDomainName : LSA_UNICODE_STRING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_crypto_key">KERB_CRYPTO_KEY</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the ticket.
     */
    SessionKey : KERB_CRYPTO_KEY

    TicketFlags : KERB_TICKET_FLAGS

    /**
     * Reserved for future use. Set this member to zero.
     */
    Flags : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the key expires.
     */
    KeyExpirationTime : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the ticket becomes valid.
     */
    StartTime : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the ticket expires.
     */
    EndTime : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the latest time a ticket can be renewed. Renewal requests sent after this time will be rejected.
     */
    RenewUntil : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the measured time difference between the current time on the computer issuing the ticket and the computer where the ticket will be used.
     */
    TimeSkew : Int64

    /**
     * The size, in bytes, of the encoded ticket.
     */
    EncodedTicketSize : UInt32

    /**
     * A buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1)-encoded ticket.
     */
    EncodedTicket : IntPtr

}
