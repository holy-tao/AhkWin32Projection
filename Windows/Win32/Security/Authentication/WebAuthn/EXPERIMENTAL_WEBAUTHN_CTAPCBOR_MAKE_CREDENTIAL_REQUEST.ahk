#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WEBAUTHN_RP_ENTITY_INFORMATION.ahk" { WEBAUTHN_RP_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_COSE_CREDENTIAL_PARAMETER.ahk" { WEBAUTHN_COSE_CREDENTIAL_PARAMETER }
#Import ".\WEBAUTHN_CREDENTIAL_EX.ahk" { WEBAUTHN_CREDENTIAL_EX }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION.ahk" { EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION }
#Import ".\WEBAUTHN_USER_ENTITY_INFORMATION.ahk" { WEBAUTHN_USER_ENTITY_INFORMATION }
#Import ".\WEBAUTHN_COSE_CREDENTIAL_PARAMETERS.ahk" { WEBAUTHN_COSE_CREDENTIAL_PARAMETERS }
#Import ".\EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS.ahk" { EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS }
#Import ".\WEBAUTHN_CREDENTIAL_LIST.ahk" { WEBAUTHN_CREDENTIAL_LIST }

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST {
    #StructPack 8

    dwVersion : UInt32

    cbRpId : UInt32

    pbRpId : IntPtr

    cbClientDataHash : UInt32

    pbClientDataHash : IntPtr

    pRpInformation : WEBAUTHN_RP_ENTITY_INFORMATION.Ptr

    pUserInformation : WEBAUTHN_USER_ENTITY_INFORMATION.Ptr

    WebAuthNCredentialParameters : WEBAUTHN_COSE_CREDENTIAL_PARAMETERS

    CredentialList : WEBAUTHN_CREDENTIAL_LIST

    cbCborExtensionsMap : UInt32

    pbCborExtensionsMap : IntPtr

    pAuthenticatorOptions : EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS.Ptr

    fEmptyPinAuth : BOOL

    cbPinAuth : UInt32

    pbPinAuth : IntPtr

    lHmacSecretExt : Int32

    pHmacSecretMcExtension : EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION.Ptr

    lPrfExt : Int32

    cbHmacSecretSaltValues : UInt32

    pbHmacSecretSaltValues : IntPtr

    dwCredProtect : UInt32

    dwPinProtocol : UInt32

    dwEnterpriseAttestation : UInt32

    cbCredBlobExt : UInt32

    pbCredBlobExt : IntPtr

    lLargeBlobKeyExt : Int32

    dwLargeBlobSupport : UInt32

    lMinPinLengthExt : Int32

    cbJsonExt : UInt32

    pbJsonExt : IntPtr

}
