#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A structure containing the client data that is sent to the authenticator.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_client_data
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CLIENT_DATA {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The size of the **pbClientDataJSON** field.
     */
    cbClientDataJSON : UInt32

    /**
     * UTF-8 encoded JSON serialization of the client data.
     */
    pbClientDataJSON : IntPtr

    /**
     * Hash algorithm ID used to hash the **pbClientDataJSON** field.
     */
    pwszHashAlgId : PWSTR

}
