#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIAL_EX.ahk" { WEBAUTHN_CREDENTIAL_EX }

/**
 * The list of credentials that the user has registered with the authenticator.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_list
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CREDENTIAL_LIST {
    #StructPack 8

    /**
     * The size of **ppCredentials**.
     */
    cCredentials : UInt32

    /**
     * The array of credentials.
     */
    ppCredentials : IntPtr

}
