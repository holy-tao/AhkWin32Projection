#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIAL_ATTESTATION extends Win32Struct
{
    static sizeof => 152

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
    pwszFormatType{
        get {
            if(!this.HasProp("__pwszFormatType"))
                this.__pwszFormatType := PWSTR(this.ptr + 8)
            return this.__pwszFormatType
        }
    }

    /**
     * @type {Integer}
     */
    cbAuthenticatorData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbAuthenticatorData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cbAttestation {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbAttestation {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwAttestationDecodeType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvAttestationDecode {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    cbAttestationObject {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbAttestationObject {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    cbCredentialId {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCredentialId {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
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
     * @type {Integer}
     */
    dwUsedTransport {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {BOOL}
     */
    bEpAtt{
        get {
            if(!this.HasProp("__bEpAtt"))
                this.__bEpAtt := BOOL(this.ptr + 116)
            return this.__bEpAtt
        }
    }

    /**
     * @type {BOOL}
     */
    bLargeBlobSupported{
        get {
            if(!this.HasProp("__bLargeBlobSupported"))
                this.__bLargeBlobSupported := BOOL(this.ptr + 120)
            return this.__bLargeBlobSupported
        }
    }

    /**
     * @type {BOOL}
     */
    bResidentKey{
        get {
            if(!this.HasProp("__bResidentKey"))
                this.__bResidentKey := BOOL(this.ptr + 124)
            return this.__bResidentKey
        }
    }

    /**
     * @type {BOOL}
     */
    bPrfEnabled{
        get {
            if(!this.HasProp("__bPrfEnabled"))
                this.__bPrfEnabled := BOOL(this.ptr + 128)
            return this.__bPrfEnabled
        }
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

    /**
     * @type {Pointer<WEBAUTHN_HMAC_SECRET_SALT>}
     */
    EXPERIMENTAL_pHmacSecret {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
