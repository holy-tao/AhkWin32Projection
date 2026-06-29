#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_LOGON_SUBMIT_TYPE.ahk" { KERB_LOGON_SUBMIT_TYPE }
#Import ".\KERB_TICKET_LOGON.ahk" { KERB_TICKET_LOGON }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information to unlock a workstation.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_unlock_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_TICKET_UNLOCK_LOGON {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_logon">KERB_TICKET_LOGON</a> structure. All members of the structure must be the same as the structure used in the original logon except the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> member, which must be set to <b>KerbTicketUnlockLogon</b>.
     */
    Logon : KERB_TICKET_LOGON

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure containing the logon identifier of the current <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>. This ID was previously returned from the initial logon by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>.
     */
    LogonId : LUID

}
