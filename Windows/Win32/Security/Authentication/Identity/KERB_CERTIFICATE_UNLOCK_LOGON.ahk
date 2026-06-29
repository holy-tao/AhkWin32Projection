#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_CERTIFICATE_LOGON.ahk" { KERB_CERTIFICATE_LOGON }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\KERB_LOGON_SUBMIT_TYPE.ahk" { KERB_LOGON_SUBMIT_TYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Contains information used to unlock a workstation that has been locked during an interactive smart card logon session.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_certificate_unlock_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CERTIFICATE_UNLOCK_LOGON {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a> structure that contains information about the logon session to unlock.
     * 
     * The <b>MessageType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a> structure must be set to <b>KerbCertificateUnlockLogon</b>.
     */
    Logon : KERB_CERTIFICATE_LOGON

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that identifies the logon session to unlock. This member is set by <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a>.
     */
    LogonId : LUID

}
