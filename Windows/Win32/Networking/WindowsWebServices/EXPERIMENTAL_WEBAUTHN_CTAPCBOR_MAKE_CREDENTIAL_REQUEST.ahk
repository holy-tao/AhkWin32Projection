#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_COSE_CREDENTIAL_PARAMETERS.ahk
#Include .\WEBAUTHN_CREDENTIAL_LIST.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_CTAPCBOR_MAKE_CREDENTIAL_REQUEST extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbRpId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbRpId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbClientDataHash {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbClientDataHash {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<WEBAUTHN_RP_ENTITY_INFORMATION>}
     */
    pRpInformation {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<WEBAUTHN_USER_ENTITY_INFORMATION>}
     */
    pUserInformation {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {WEBAUTHN_COSE_CREDENTIAL_PARAMETERS}
     */
    WebAuthNCredentialParameters{
        get {
            if(!this.HasProp("__WebAuthNCredentialParameters"))
                this.__WebAuthNCredentialParameters := WEBAUTHN_COSE_CREDENTIAL_PARAMETERS(this.ptr + 48)
            return this.__WebAuthNCredentialParameters
        }
    }

    /**
     * @type {WEBAUTHN_CREDENTIAL_LIST}
     */
    CredentialList{
        get {
            if(!this.HasProp("__CredentialList"))
                this.__CredentialList := WEBAUTHN_CREDENTIAL_LIST(this.ptr + 64)
            return this.__CredentialList
        }
    }

    /**
     * @type {Integer}
     */
    cbCborExtensionsMap {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCborExtensionsMap {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer<EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS>}
     */
    pAuthenticatorOptions {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {BOOL}
     */
    fEmptyPinAuth{
        get {
            if(!this.HasProp("__fEmptyPinAuth"))
                this.__fEmptyPinAuth := BOOL(this.ptr + 104)
            return this.__fEmptyPinAuth
        }
    }

    /**
     * @type {Integer}
     */
    cbPinAuth {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPinAuth {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    lHmacSecretExt {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * @type {Pointer<EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION>}
     */
    pHmacSecretMcExtension {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    lPrfExt {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    cbHmacSecretSaltValues {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbHmacSecretSaltValues {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    dwCredProtect {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    dwPinProtocol {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    dwEnterpriseAttestation {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    cbCredBlobExt {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCredBlobExt {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    lLargeBlobKeyExt {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    dwLargeBlobSupport {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    lMinPinLengthExt {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    cbJsonExt {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbJsonExt {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }
}
