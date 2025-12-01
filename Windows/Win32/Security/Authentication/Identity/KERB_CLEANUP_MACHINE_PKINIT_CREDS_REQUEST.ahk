#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * Cleans up the PKINIT device credentials from the computer.
 * @remarks
 * You must clean up PKINIT device credentials for LOCAL_SYSTEM 	or NETWORK_SERVICE. When the PKINIT device credential is cleaned up, only the password credentials remain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_cleanup_machine_pkinit_creds_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CLEANUP_MACHINE_PKINIT_CREDS_REQUEST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The type of the message. You should set this to <b>KerbCleanupMachinePkinitCredsMessage</b>.
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The logon session identifier. You should set this to SYSTEM LUID or NETWORKSERVICE LUID. TCB is required if this field is different from the caller's LUID.
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(8, this)
            return this.__LogonId
        }
    }
}
