#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KERB_TICKET_LOGON.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * Contains information to unlock a workstation.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_unlock_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_TICKET_UNLOCK_LOGON extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_ticket_logon">KERB_TICKET_LOGON</a> structure. All members of the structure must be the same as the structure used in the original logon except the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ne-ntsecapi-kerb_logon_submit_type">KERB_LOGON_SUBMIT_TYPE</a> member, which must be set to <b>KerbTicketUnlockLogon</b>.
     * @type {KERB_TICKET_LOGON}
     */
    Logon{
        get {
            if(!this.HasProp("__Logon"))
                this.__Logon := KERB_TICKET_LOGON(this.ptr + 0)
            return this.__Logon
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure containing the logon identifier of the current <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>. This ID was previously returned from the initial logon by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a>.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 32)
            return this.__LogonId
        }
    }
}
