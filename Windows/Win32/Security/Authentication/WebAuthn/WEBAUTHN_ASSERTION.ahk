#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_CREDENTIAL.ahk" { WEBAUTHN_CREDENTIAL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_EXTENSION.ahk" { WEBAUTHN_EXTENSION }
#Import ".\WEBAUTHN_EXTENSIONS.ahk" { WEBAUTHN_EXTENSIONS }
#Import ".\WEBAUTHN_HMAC_SECRET_SALT.ahk" { WEBAUTHN_HMAC_SECRET_SALT }

/**
 * A structure that contains the data necessary to verify an assertion.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_assertion
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_ASSERTION {
    #StructPack 8

    /**
     * The version of this structure.
     */
    dwVersion : UInt32

    /**
     * The size of the authenticator data.
     */
    cbAuthenticatorData : UInt32

    /**
     * A pointer to the authenticator data.
     */
    pbAuthenticatorData : IntPtr

    /**
     * The size of the signature that was generated for this assertion.
     */
    cbSignature : UInt32

    /**
     * A pointer to the signature that was generated for this assertion.
     */
    pbSignature : IntPtr

    /**
     * The credential that was used for this assertion.
     */
    Credential : WEBAUTHN_CREDENTIAL

    /**
     * The size of the user Id.
     */
    cbUserId : UInt32

    /**
     * A pointer to the user Id.
     */
    pbUserId : IntPtr

    /**
     * A CBOR map from extension identifiers to their authenticator extension inputs, created by the client based on the extensions requested by the Relying Party, if any.
     */
    Extensions : WEBAUTHN_EXTENSIONS

    /**
     * The size of **pbCredLargeBlob**.
     */
    cbCredLargeBlob : UInt32

    /**
     * A pointer to the credential blob.
     */
    pbCredLargeBlob : IntPtr

    /**
     * The status of the credential blob.
     */
    dwCredLargeBlobStatus : UInt32

    /**
     * A salt used to generate the HMAC secret.
     */
    pHmacSecret : WEBAUTHN_HMAC_SECRET_SALT.Ptr

    dwUsedTransport : UInt32

    cbUnsignedExtensionOutputs : UInt32

    pbUnsignedExtensionOutputs : IntPtr

    cbClientDataJSON : UInt32

    pbClientDataJSON : IntPtr

    cbAuthenticationResponseJSON : UInt32

    pbAuthenticationResponseJSON : IntPtr

}
