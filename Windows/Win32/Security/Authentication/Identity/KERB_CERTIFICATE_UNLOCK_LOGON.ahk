#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_CERTIFICATE_LOGON.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * Contains information used to unlock a workstation that has been locked during an interactive smart card logon session.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_certificate_unlock_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CERTIFICATE_UNLOCK_LOGON extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a> structure that contains information about the logon session to unlock.
     * 
     * The <b>MessageType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_logon">KERB_CERTIFICATE_LOGON</a> structure must be set to <b>KerbCertificateUnlockLogon</b>.
     * @type {KERB_CERTIFICATE_LOGON}
     */
    Logon{
        get {
            if(!this.HasProp("__Logon"))
                this.__Logon := KERB_CERTIFICATE_LOGON(0, this)
            return this.__Logon
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that identifies the logon session to unlock. This member is set by <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/winlogon">Winlogon</a>.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(72, this)
            return this.__LogonId
        }
    }
}
