#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WEBAUTHN_EXTENSION.ahk" { WEBAUTHN_EXTENSION }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WEBAUTHN_EXTENSIONS.ahk" { WEBAUTHN_EXTENSIONS }
#Import ".\WEBAUTHN_HMAC_SECRET_SALT.ahk" { WEBAUTHN_HMAC_SECRET_SALT }

/**
 * Contains the attestation data for a credential.
 * @remarks
 * The **pvAttestationDecode** depends on the **dwAttestationDecodeType**:
 * 
 * | **Decode type** | **Decode value** |
 * |----------|----------|
 * | **WEBAUTHN_ATTESTATION_DECODE_NONE** | **NULL** - not able to decode the CBOR attestation information |
 * | **WEBAUTHN_ATTESTATION_DECODE_COMMON** | **PWEBAUTHN_COMMON_ATTESTATION** |
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_attestation
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
export default struct WEBAUTHN_CREDENTIAL_ATTESTATION {
    #StructPack 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     */
    dwVersion : UInt32

    /**
     * The attestation format type.
     */
    pwszFormatType : PWSTR

    /**
     * The size of **pbAuthenticatorData**.
     */
    cbAuthenticatorData : UInt32

    /**
     * The authenticator data that was created for this credential.
     */
    pbAuthenticatorData : IntPtr

    /**
     * The size of the CBOR encoded attestation information.
     */
    cbAttestation : UInt32

    /**
     * The encoded CBOR attestation information.
     */
    pbAttestation : IntPtr

    /**
     * The attestation decode type.
     */
    dwAttestationDecodeType : UInt32

    /**
     * The attestation decode value.
     */
    pvAttestationDecode : IntPtr

    /**
     * The size of **pbAttestationObject**.
     */
    cbAttestationObject : UInt32

    /**
     * The CBOR encoded Attestation Object to be returned to the Relying Party.
     */
    pbAttestationObject : IntPtr

    /**
     * The size of **pbCredentialId**.
     */
    cbCredentialId : UInt32

    /**
     * The CredentialId bytes extracted from the Authenticator Data. Used by Edge to return to the Relying Party.
     */
    pbCredentialId : IntPtr

    /**
     * The extensions for this credential.
     */
    Extensions : WEBAUTHN_EXTENSIONS

    /**
     * One of the **WEBAUTHN_CTAP_TRANSPORT** bits is passed, according to the transport that was used.
     */
    dwUsedTransport : UInt32

    /**
     * The EP attestation flag.
     */
    bEpAtt : BOOL

    /**
     * Indicates whether the authenticator supports large blob attestation.
     */
    bLargeBlobSupported : BOOL

    /**
     * Indicates whether the relying party requires a resident key.
     */
    bResidentKey : BOOL

    bPrfEnabled : BOOL

    cbUnsignedExtensionOutputs : UInt32

    pbUnsignedExtensionOutputs : IntPtr

    pHmacSecret : WEBAUTHN_HMAC_SECRET_SALT.Ptr

    bThirdPartyPayment : BOOL

    dwTransports : UInt32

    cbClientDataJSON : UInt32

    pbClientDataJSON : IntPtr

    cbRegistrationResponseJSON : UInt32

    pbRegistrationResponseJSON : IntPtr

}
