#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIAL.ahk" { WEBAUTHN_CREDENTIAL }

/**
 * The array of credentials that the user has registered with the authenticator.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credentials
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CREDENTIALS {
    #StructPack 8

    /**
     * The size of **pCredentials**.
     */
    cCredentials : UInt32

    /**
     * The array of credentials.
     */
    pCredentials : WEBAUTHN_CREDENTIAL.Ptr

}
