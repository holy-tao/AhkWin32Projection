#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about a credential.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CREDENTIAL {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The size of **pbId**.
     */
    cbId : UInt32

    /**
     * Unique ID for this particular credential.
     */
    pbId : IntPtr

    /**
     * Well-known credential type specifying the type of this particular credential.
     */
    pwszCredentialType : PWSTR

}
