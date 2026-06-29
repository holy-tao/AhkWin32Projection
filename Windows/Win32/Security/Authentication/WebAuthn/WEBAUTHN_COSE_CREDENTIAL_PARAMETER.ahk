#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The structure containing the COSE credential parameter information.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cose_credential_parameter
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_COSE_CREDENTIAL_PARAMETER {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * Well-known credential type specifying a credential to create.
     */
    pwszCredentialType : PWSTR

    /**
     * Well-known COSE algorithm specifying the algorithm to use for the credential.
     */
    lAlg : Int32

}
