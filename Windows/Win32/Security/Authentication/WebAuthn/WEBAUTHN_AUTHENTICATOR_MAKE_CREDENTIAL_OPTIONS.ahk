#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIALS.ahk" { WEBAUTHN_CREDENTIALS }
#Import ".\WEBAUTHN_EXTENSION.ahk" { WEBAUTHN_EXTENSION }
#Import ".\WEBAUTHN_HMAC_SECRET_SALT.ahk" { WEBAUTHN_HMAC_SECRET_SALT }
#Import ".\WEBAUTHN_CREDENTIAL.ahk" { WEBAUTHN_CREDENTIAL }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_EXTENSIONS.ahk" { WEBAUTHN_EXTENSIONS }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WEBAUTHN_CREDENTIAL_LIST.ahk" { WEBAUTHN_CREDENTIAL_LIST }
#Import ".\CTAPCBOR_HYBRID_STORAGE_LINKED_DATA.ahk" { CTAPCBOR_HYBRID_STORAGE_LINKED_DATA }

/**
 * The options for the WebAuthNAuthenticatorMakeCredential operation.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_authenticator_make_credential_options
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS {
    #StructPack 8

    /**
     * Version of this structure.
     */
    dwVersion : UInt32

    /**
     * Time that the operation is expected to complete within. This is used as guidance, and can be overridden by the platform.
     */
    dwTimeoutMilliseconds : UInt32

    /**
     * Credentials used for exclusion.
     */
    CredentialList : WEBAUTHN_CREDENTIALS

    /**
     * _Optional_ extensions to parse when performing the operation.
     */
    Extensions : WEBAUTHN_EXTENSIONS

    /**
     * _Optional_ platform vs cross-platform authenticators.
     */
    dwAuthenticatorAttachment : UInt32

    /**
     * Require key to be resident or not. This is _optional_ and defaults to **FALSE**.
     */
    bRequireResidentKey : BOOL

    /**
     * The user verification requirement.
     */
    dwUserVerificationRequirement : UInt32

    /**
     * The attestation conveyance preference.
     */
    dwAttestationConveyancePreference : UInt32

    /**
     * The flags (_reserved for future use_).
     */
    dwFlags : UInt32

    /**
     * The _optional_ cancellation Id.  See [WebAuthNGetCancellationId](./nf-webauthn-webauthngetcancellationid.md) for more information.
     */
    pCancellationId : Guid.Ptr

    /**
     * The exclude credential list. If present, **CredentialList** will be ignored.
     */
    pExcludeCredentialList : WEBAUTHN_CREDENTIAL_LIST.Ptr

    /**
     * The enterprise attestation.
     */
    dwEnterpriseAttestation : UInt32

    /**
     * The requested large blob support: **none**, **required** or **preferred**. User will receive **NTE_INVALID_PARAMETER** when large blob is set to **required** or **preferred** and **bRequireResidentKey** isn't set to **TRUE**.
     */
    dwLargeBlobSupport : UInt32

    /**
     * Prefer key to be resident. Optional parameter, defaulting to **FALSE**. When **TRUE**, overrides **bRequireResidentKey**.
     */
    bPreferResidentKey : BOOL

    /**
     * Indicates whether the client is using in-private mode in the browser. An _optional_ parameter that defaults to **FALSE**.
     */
    bBrowserInPrivateMode : BOOL

    bEnablePrf : BOOL

    pLinkedDevice : CTAPCBOR_HYBRID_STORAGE_LINKED_DATA.Ptr

    cbJsonExt : UInt32

    pbJsonExt : IntPtr

    pPRFGlobalEval : WEBAUTHN_HMAC_SECRET_SALT.Ptr

    cCredentialHints : UInt32

    ppwszCredentialHints : PWSTR.Ptr

    bThirdPartyPayment : BOOL

    pwszRemoteWebOrigin : PWSTR

    cbPublicKeyCredentialCreationOptionsJSON : UInt32

    pbPublicKeyCredentialCreationOptionsJSON : IntPtr

    cbAuthenticatorId : UInt32

    pbAuthenticatorId : IntPtr

}
