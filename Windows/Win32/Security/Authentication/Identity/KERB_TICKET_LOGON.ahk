#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_LOGON_SUBMIT_TYPE.ahk" { KERB_LOGON_SUBMIT_TYPE }

/**
 * Contains profile information for a network logon.
 * @remarks
 * The service ticket must be for the host SPN of the computer. If the ticket includes a Windows Privilege Attribute Certificate (PAC), it will be used to construct the user's logon token. Otherwise, an anonymous token will be created using the client principal name in the ticket.
 * 
 * If a ticket-granting ticket (TGT) is supplied as a KRB_CRED message, it is placed in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a> credentials cache. If the TGT is omitted, the logon will be only for the local machine.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_TICKET_LOGON {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> value identifying the type of logon request being made. This member must be set to <b>KerbTicketLogon</b>.
     */
    MessageType : KERB_LOGON_SUBMIT_TYPE

    /**
     * <b>ULONG</b> that can be set to KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET to allow a locked workstation to re-logon with expired ticket. Other values are ignored.
     */
    Flags : UInt32

    /**
     * Indicates the length of the <b>ServiceTicket</b> buffer.
     */
    ServiceTicketLength : UInt32

    /**
     * Indicates the length of the <b>TicketGrantingTicket</b> buffer. Must be set to zero for an empty buffer.
     */
    TicketGrantingTicketLength : UInt32

    /**
     * Required ticket for service "host" or the computer account <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">service principal name</a> (SPN) in the form of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ASN.1</a> encoded Kerberos ticket. Expired tickets are acceptable if the <b>Flags</b> member is set to KERB_LOGON_FLAG_ALLOW_EXPIRED_TICKET.
     */
    ServiceTicket : IntPtr

    /**
     * Optional buffer containing an ASN.1-encoded KRB_CRED message containing the user's Kerberos ticket-granting ticket (KRBTGT) to be used to initialize the credential cache. The ticket must have the "forwarded" flag set in the ticket options. The KRB_CRED message is defined in Section 5.8 of  Internet <a href="http://www.ietf.org/rfc/rfc4120.txt">RFC 4120</a>. For more information, see <a href="https://www.ietf.org/">http://www.ietf.org</a>.
     */
    TicketGrantingTicket : IntPtr

}
