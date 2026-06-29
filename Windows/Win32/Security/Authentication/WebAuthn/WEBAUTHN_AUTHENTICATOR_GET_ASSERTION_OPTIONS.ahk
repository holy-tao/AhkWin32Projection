#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIALS.ahk" { WEBAUTHN_CREDENTIALS }
#Import ".\WEBAUTHN_EXTENSION.ahk" { WEBAUTHN_EXTENSION }
#Import ".\WEBAUTHN_CREDENTIAL.ahk" { WEBAUTHN_CREDENTIAL }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_EXTENSIONS.ahk" { WEBAUTHN_EXTENSIONS }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WEBAUTHN_HMAC_SECRET_SALT_VALUES.ahk" { WEBAUTHN_HMAC_SECRET_SALT_VALUES }
#Import ".\CTAPCBOR_HYBRID_STORAGE_LINKED_DATA.ahk" { CTAPCBOR_HYBRID_STORAGE_LINKED_DATA }
#Import ".\WEBAUTHN_CREDENTIAL_LIST.ahk" { WEBAUTHN_CREDENTIAL_LIST }

/**
 * A structure that contains the options to get an assertion.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_authenticator_get_assertion_options
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS {
    #StructPack 8

    /**
     * The version of this structure.
     */
    dwVersion : UInt32

    /**
     * Time that the operation is expected to complete within. This is used as guidance and can be overridden by the platform.
     */
    dwTimeoutMilliseconds : UInt32

    /**
     * The list of allowed credentials to be used in the assertion.
     */
    CredentialList : WEBAUTHN_CREDENTIALS

    /**
     * A CBOR map from extension identifiers to their authenticator extension inputs, created by the client based on the extensions requested by the Relying Party. These are _optional_ extensions to parse when performing the operation.
     */
    Extensions : WEBAUTHN_EXTENSIONS

    /**
     * The attachment for the assertion. _Optional_ platform vs cross-platform authenticators.
     */
    dwAuthenticatorAttachment : UInt32

    /**
     * The effective user verification requirement.
     */
    dwUserVerificationRequirement : UInt32

    /**
     * The flags for the assertion.
     */
    dwFlags : UInt32

    /**
     * _Optional_ identifier for the U2F AppId. Converted to UTF8 before being hashed. Not lower-cased.
     */
    pwszU2fAppId : PWSTR

    /**
     * If this is non-NULL, then, set to **TRUE** if the **pwszU2fAppid** was used instead of **PCWSTR pwszRpId**.
     */
    pbU2fAppId : BOOL.Ptr

    /**
     * _Optional_ cancellation Id. See [WebAuthNGetCancellationId](./nf-webauthn-webauthngetcancellationid.md) for more information.
     */
    pCancellationId : Guid.Ptr

    /**
     * An _optional_ list of public key credential descriptors describing credentials acceptable to the Relying Party (possibly filtered by the client), if any. If present, **CredentialList** will be ignored.
     */
    pAllowCredentialList : WEBAUTHN_CREDENTIAL_LIST.Ptr

    /**
     * The large blob operation.
     */
    dwCredLargeBlobOperation : UInt32

    /**
     * Size of **pbCredLargeBlob**.
     */
    cbCredLargeBlob : UInt32

    /**
     * A pointer to the large credential blob.
     */
    pbCredLargeBlob : IntPtr

    /**
     * PRF values which will be converted into HMAC-SECRET values according to the WebAuthN Spec.
     */
    pHmacSecretSaltValues : WEBAUTHN_HMAC_SECRET_SALT_VALUES.Ptr

    /**
     * Indicates whether the client is using in-private mode in the browser. An _optional_ parameter that defaults to **FALSE**.
     */
    bBrowserInPrivateMode : BOOL

    pLinkedDevice : CTAPCBOR_HYBRID_STORAGE_LINKED_DATA.Ptr

    bAutoFill : BOOL

    cbJsonExt : UInt32

    pbJsonExt : IntPtr

    cCredentialHints : UInt32

    ppwszCredentialHints : PWSTR.Ptr

    pwszRemoteWebOrigin : PWSTR

    cbPublicKeyCredentialRequestOptionsJSON : UInt32

    pbPublicKeyCredentialRequestOptionsJSON : IntPtr

    cbAuthenticatorId : UInt32

    pbAuthenticatorId : IntPtr

}
