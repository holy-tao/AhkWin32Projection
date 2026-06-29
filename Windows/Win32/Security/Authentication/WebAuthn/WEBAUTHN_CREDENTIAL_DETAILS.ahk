#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_USER_ENTITY_INFORMATION.ahk" { WEBAUTHN_USER_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_RP_ENTITY_INFORMATION.ahk" { WEBAUTHN_RP_ENTITY_INFORMATION }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the data for a credential.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_details
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CREDENTIAL_DETAILS {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The size of pbCredentialID.
     */
    cbCredentialID : UInt32

    /**
     * The credential Id.
     */
    pbCredentialID : IntPtr

    /**
     * The relying party information.
     */
    pRpInformation : WEBAUTHN_RP_ENTITY_INFORMATION.Ptr

    /**
     * The user information.
     */
    pUserInformation : WEBAUTHN_USER_ENTITY_INFORMATION.Ptr

    /**
     * Indicates if the credential is removable or not.
     */
    bRemovable : BOOL

    bBackedUp : BOOL

    pwszAuthenticatorName : PWSTR

    cbAuthenticatorLogo : UInt32

    pbAuthenticatorLogo : IntPtr

    bThirdPartyPayment : BOOL

    dwTransports : UInt32

}
