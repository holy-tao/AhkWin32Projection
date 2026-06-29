#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS.ahk" { EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_CREDENTIAL_EX.ahk" { WEBAUTHN_CREDENTIAL_EX }
#Import ".\WEBAUTHN_CREDENTIAL_LIST.ahk" { WEBAUTHN_CREDENTIAL_LIST }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION.ahk" { EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST {
    #StructPack 8

    dwVersion : UInt32

    pwszRpId : PWSTR

    cbRpId : UInt32

    pbRpId : IntPtr

    cbClientDataHash : UInt32

    pbClientDataHash : IntPtr

    CredentialList : WEBAUTHN_CREDENTIAL_LIST

    cbCborExtensionsMap : UInt32

    pbCborExtensionsMap : IntPtr

    pAuthenticatorOptions : EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS.Ptr

    fEmptyPinAuth : BOOL

    cbPinAuth : UInt32

    pbPinAuth : IntPtr

    pHmacSaltExtension : EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION.Ptr

    cbHmacSecretSaltValues : UInt32

    pbHmacSecretSaltValues : IntPtr

    dwPinProtocol : UInt32

    lCredBlobExt : Int32

    lLargeBlobKeyExt : Int32

    dwCredLargeBlobOperation : UInt32

    cbCredLargeBlobCompressed : UInt32

    pbCredLargeBlobCompressed : IntPtr

    dwCredLargeBlobOriginalSize : UInt32

    cbJsonExt : UInt32

    pbJsonExt : IntPtr

}
