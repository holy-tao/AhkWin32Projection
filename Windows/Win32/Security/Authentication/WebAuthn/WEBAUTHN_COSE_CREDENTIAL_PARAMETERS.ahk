#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_COSE_CREDENTIAL_PARAMETER.ahk" { WEBAUTHN_COSE_CREDENTIAL_PARAMETER }

/**
 * The structure containing the COSE parameters for a credential.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cose_credential_parameters
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_COSE_CREDENTIAL_PARAMETERS {
    #StructPack 8

    /**
     * The COSE parameters for the credential.
     */
    cCredentialParameters : UInt32

    /**
     * A pointer to the COSE parameters for the credential.
     */
    pCredentialParameters : WEBAUTHN_COSE_CREDENTIAL_PARAMETER.Ptr

}
