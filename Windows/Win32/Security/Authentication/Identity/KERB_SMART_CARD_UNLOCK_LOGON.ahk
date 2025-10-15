#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_SMART_CARD_LOGON.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * Contains information used to unlock a workstation that has been locked during a smart card logon session.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_smart_card_unlock_logon
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_SMART_CARD_UNLOCK_LOGON extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_smart_card_logon">KERB_SMART_CARD_LOGON</a> structure that specifies the smart card logon session. The <b>MessageType</b> member of the <b>KERB_SMART_CARD_LOGON</b> structure must be set to <b>KerbWorkstationUnlockLogon</b>.
     * @type {KERB_SMART_CARD_LOGON}
     */
    Logon{
        get {
            if(!this.HasProp("__Logon"))
                this.__Logon := KERB_SMART_CARD_LOGON(this.ptr + 0)
            return this.__Logon
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> structure that contains the identity of the user attempting to unlock the workstation.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 40)
            return this.__LogonId
        }
    }
}
