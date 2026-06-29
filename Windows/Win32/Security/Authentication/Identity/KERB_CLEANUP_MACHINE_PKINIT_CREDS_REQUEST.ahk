#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KERB_PROTOCOL_MESSAGE_TYPE.ahk" { KERB_PROTOCOL_MESSAGE_TYPE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }

/**
 * Cleans up the PKINIT device credentials from the computer.
 * @remarks
 * You must clean up PKINIT device credentials for LOCAL_SYSTEM 	or NETWORK_SERVICE. When the PKINIT device credential is cleaned up, only the password credentials remain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_cleanup_machine_pkinit_creds_request
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CLEANUP_MACHINE_PKINIT_CREDS_REQUEST {
    #StructPack 4

    /**
     * The type of the message. You should set this to <b>KerbCleanupMachinePkinitCredsMessage</b>.
     */
    MessageType : KERB_PROTOCOL_MESSAGE_TYPE

    /**
     * The logon session identifier. You should set this to SYSTEM LUID or NETWORKSERVICE LUID. TCB is required if this field is different from the caller's LUID.
     */
    LogonId : LUID

}
