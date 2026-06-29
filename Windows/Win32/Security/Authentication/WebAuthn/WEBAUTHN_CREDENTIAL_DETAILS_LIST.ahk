#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIAL_DETAILS.ahk" { WEBAUTHN_CREDENTIAL_DETAILS }

/**
 * The list of credentials.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_details_list
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CREDENTIAL_DETAILS_LIST {
    #StructPack 8

    /**
     * The size of the credential details array.
     */
    cCredentialDetails : UInt32

    /**
     * The credential details array.
     */
    ppCredentialDetails : IntPtr

}
