#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIALS.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS extends Win32Struct
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
    dwTimeoutMilliseconds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {WEBAUTHN_CREDENTIALS}
     */
    CredentialList{
        get {
            if(!this.HasProp("__CredentialList"))
                this.__CredentialList := WEBAUTHN_CREDENTIALS(this.ptr + 8)
            return this.__CredentialList
        }
    }

    /**
     * @type {WEBAUTHN_EXTENSIONS}
     */
    Extensions{
        get {
            if(!this.HasProp("__Extensions"))
                this.__Extensions := WEBAUTHN_EXTENSIONS(this.ptr + 24)
            return this.__Extensions
        }
    }

    /**
     * @type {Integer}
     */
    dwAuthenticatorAttachment {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    bRequireResidentKey {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwUserVerificationRequirement {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwAttestationConveyancePreference {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<Guid>}
     */
    pCancellationId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<WEBAUTHN_CREDENTIAL_LIST>}
     */
    pExcludeCredentialList {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    dwEnterpriseAttestation {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    dwLargeBlobSupport {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    bPreferResidentKey {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    bBrowserInPrivateMode {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    bEnablePrf {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Pointer<CTAPCBOR_HYBRID_STORAGE_LINKED_DATA>}
     */
    pLinkedDevice {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    cbJsonExt {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbJsonExt {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer<WEBAUTHN_HMAC_SECRET_SALT>}
     */
    EXPERIMENTAL_pPRFGlobalEval {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
