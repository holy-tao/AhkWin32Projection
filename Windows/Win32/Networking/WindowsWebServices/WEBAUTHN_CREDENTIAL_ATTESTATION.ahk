#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk

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
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIAL_ATTESTATION extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The attestation format type.
     * @type {Pointer<Char>}
     */
    pwszFormatType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of **pbAuthenticatorData**.
     * @type {Integer}
     */
    cbAuthenticatorData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The authenticator data that was created for this credential.
     * @type {Pointer<Byte>}
     */
    pbAuthenticatorData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of the CBOR encoded attestation information.
     * @type {Integer}
     */
    cbAttestation {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The encoded CBOR attestation information.
     * @type {Pointer<Byte>}
     */
    pbAttestation {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The attestation decode type.
     * @type {Integer}
     */
    dwAttestationDecodeType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The attestation decode value.
     * @type {Pointer<Void>}
     */
    pvAttestationDecode {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The size of **pbAttestationObject**.
     * @type {Integer}
     */
    cbAttestationObject {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The CBOR encoded Attestation Object to be returned to the Relying Party.
     * @type {Pointer<Byte>}
     */
    pbAttestationObject {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The size of **pbCredentialId**.
     * @type {Integer}
     */
    cbCredentialId {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The CredentialId bytes extracted from the Authenticator Data. Used by Edge to return to the Relying Party.
     * @type {Pointer<Byte>}
     */
    pbCredentialId {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * The extensions for this credential.
     * @type {WEBAUTHN_EXTENSIONS}
     */
    Extensions{
        get {
            if(!this.HasProp("__Extensions"))
                this.__Extensions := WEBAUTHN_EXTENSIONS(this.ptr + 96)
            return this.__Extensions
        }
    }

    /**
     * One of the **WEBAUTHN_CTAP_TRANSPORT** bits is passed, according to the transport that was used.
     * @type {Integer}
     */
    dwUsedTransport {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The EP attestation flag.
     * @type {Integer}
     */
    bEpAtt {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Indicates whether the authenticator supports large blob attestation.
     * @type {Integer}
     */
    bLargeBlobSupported {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * Indicates whether the relying party requires a resident key.
     * @type {Integer}
     */
    bResidentKey {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    bPrfEnabled {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    cbUnsignedExtensionOutputs {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbUnsignedExtensionOutputs {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }
}
