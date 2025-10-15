#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WEBAUTHN_CREDENTIAL_LIST.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_CTAPCBOR_GET_ASSERTION_REQUEST extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwszRpId{
        get {
            if(!this.HasProp("__pwszRpId"))
                this.__pwszRpId := PWSTR(this.ptr + 8)
            return this.__pwszRpId
        }
    }

    /**
     * @type {Integer}
     */
    cbRpId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbRpId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cbClientDataHash {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbClientDataHash {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {WEBAUTHN_CREDENTIAL_LIST}
     */
    CredentialList{
        get {
            if(!this.HasProp("__CredentialList"))
                this.__CredentialList := WEBAUTHN_CREDENTIAL_LIST(this.ptr + 48)
            return this.__CredentialList
        }
    }

    /**
     * @type {Integer}
     */
    cbCborExtensionsMap {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCborExtensionsMap {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer<EXPERIMENTAL_WEBAUTHN_CTAPCBOR_AUTHENTICATOR_OPTIONS>}
     */
    pAuthenticatorOptions {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {BOOL}
     */
    fEmptyPinAuth{
        get {
            if(!this.HasProp("__fEmptyPinAuth"))
                this.__fEmptyPinAuth := BOOL(this.ptr + 88)
            return this.__fEmptyPinAuth
        }
    }

    /**
     * @type {Integer}
     */
    cbPinAuth {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPinAuth {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<EXPERIMENTAL_WEBAUTHN_CTAPCBOR_HMAC_SALT_EXTENSION>}
     */
    pHmacSaltExtension {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    cbHmacSecretSaltValues {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbHmacSecretSaltValues {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    dwPinProtocol {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    lCredBlobExt {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    lLargeBlobKeyExt {
        get => NumGet(this, 136, "int")
        set => NumPut("int", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    dwCredLargeBlobOperation {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    cbCredLargeBlobCompressed {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCredLargeBlobCompressed {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    dwCredLargeBlobOriginalSize {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    cbJsonExt {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbJsonExt {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }
}
