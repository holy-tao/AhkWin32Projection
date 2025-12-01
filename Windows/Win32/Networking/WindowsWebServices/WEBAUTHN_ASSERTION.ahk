#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIAL.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk

/**
 * A structure that contains the data necessary to verify an assertion.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_assertion
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_ASSERTION extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The version of this structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the authenticator data.
     * @type {Integer}
     */
    cbAuthenticatorData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the authenticator data.
     * @type {Pointer<Integer>}
     */
    pbAuthenticatorData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the signature that was generated for this assertion.
     * @type {Integer}
     */
    cbSignature {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to the signature that was generated for this assertion.
     * @type {Pointer<Integer>}
     */
    pbSignature {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The credential that was used for this assertion.
     * @type {WEBAUTHN_CREDENTIAL}
     */
    Credential{
        get {
            if(!this.HasProp("__Credential"))
                this.__Credential := WEBAUTHN_CREDENTIAL(32, this)
            return this.__Credential
        }
    }

    /**
     * The size of the user Id.
     * @type {Integer}
     */
    cbUserId {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A pointer to the user Id.
     * @type {Pointer<Integer>}
     */
    pbUserId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A CBOR map from extension identifiers to their authenticator extension inputs, created by the client based on the extensions requested by the Relying Party, if any.
     * @type {WEBAUTHN_EXTENSIONS}
     */
    Extensions{
        get {
            if(!this.HasProp("__Extensions"))
                this.__Extensions := WEBAUTHN_EXTENSIONS(72, this)
            return this.__Extensions
        }
    }

    /**
     * The size of **pbCredLargeBlob**.
     * @type {Integer}
     */
    cbCredLargeBlob {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * A pointer to the credential blob.
     * @type {Pointer<Integer>}
     */
    pbCredLargeBlob {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * The status of the credential blob.
     * @type {Integer}
     */
    dwCredLargeBlobStatus {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A salt used to generate the HMAC secret.
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
     * @type {Pointer<Integer>}
     */
    pbUnsignedExtensionOutputs {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
