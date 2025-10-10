#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIAL.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_ASSERTION extends Win32Struct
{
    static sizeof => 136

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
    cbAuthenticatorData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbAuthenticatorData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbSignature {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbSignature {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {WEBAUTHN_CREDENTIAL}
     */
    Credential{
        get {
            if(!this.HasProp("__Credential"))
                this.__Credential := WEBAUTHN_CREDENTIAL(this.ptr + 32)
            return this.__Credential
        }
    }

    /**
     * @type {Integer}
     */
    cbUserId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbUserId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {WEBAUTHN_EXTENSIONS}
     */
    Extensions{
        get {
            if(!this.HasProp("__Extensions"))
                this.__Extensions := WEBAUTHN_EXTENSIONS(this.ptr + 72)
            return this.__Extensions
        }
    }

    /**
     * @type {Integer}
     */
    cbCredLargeBlob {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbCredLargeBlob {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    dwCredLargeBlobStatus {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Pointer<WEBAUTHN_HMAC_SECRET_SALT>}
     */
    pHmacSecret {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    dwUsedTransport {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    cbUnsignedExtensionOutputs {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbUnsignedExtensionOutputs {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
