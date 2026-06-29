#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_SMART_CARD_LOGON.ahk" { KERB_SMART_CARD_LOGON }
#Import ".\KERB_LOGON_SUBMIT_TYPE.ahk" { KERB_LOGON_SUBMIT_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information used to unlock a workstation that has been locked during a smart card logon session.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_smart_card_unlock_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_SMART_CARD_UNLOCK_LOGON {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_smart_card_logon">KERB_SMART_CARD_LOGON</a> structure that specifies the smart card logon session. The <b>MessageType</b> member of the <b>KERB_SMART_CARD_LOGON</b> structure must be set to <b>KerbWorkstationUnlockLogon</b>.
     */
    Logon : KERB_SMART_CARD_LOGON

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that contains the identity of the user attempting to unlock the workstation.
     */
    LogonId : LUID

}
