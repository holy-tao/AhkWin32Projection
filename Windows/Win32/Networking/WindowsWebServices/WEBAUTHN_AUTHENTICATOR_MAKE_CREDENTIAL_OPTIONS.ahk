#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIALS.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk

/**
 * The options for the WebAuthNAuthenticatorMakeCredential operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_authenticator_make_credential_options
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_AUTHENTICATOR_MAKE_CREDENTIAL_OPTIONS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * Version of this structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Time that the operation is expected to complete within. This is used as guidance, and can be overridden by the platform.
     * @type {Integer}
     */
    dwTimeoutMilliseconds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Credentials used for exclusion.
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
     * _Optional_ extensions to parse when performing the operation.
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
     * _Optional_ platform vs cross-platform authenticators.
     * @type {Integer}
     */
    dwAuthenticatorAttachment {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Require key to be resident or not. This is _optional_ and defaults to **FALSE**.
     * @type {Integer}
     */
    bRequireResidentKey {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * The user verification requirement.
     * @type {Integer}
     */
    dwUserVerificationRequirement {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The attestation conveyance preference.
     * @type {Integer}
     */
    dwAttestationConveyancePreference {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The flags (_reserved for future use_).
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The _optional_ cancellation Id.  See [WebAuthNGetCancellationId](./nf-webauthn-webauthngetcancellationid.md) for more information.
     * @type {Pointer<Guid>}
     */
    pCancellationId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The exclude credential list. If present, **CredentialList** will be ignored.
     * @type {Pointer<WEBAUTHN_CREDENTIAL_LIST>}
     */
    pExcludeCredentialList {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * The enterprise attestation.
     * @type {Integer}
     */
    dwEnterpriseAttestation {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The requested large blob support: **none**, **required** or **preferred**. User will receive **NTE_INVALID_PARAMETER** when large blob is set to **required** or **preferred** and **bRequireResidentKey** isn't set to **TRUE**.
     * @type {Integer}
     */
    dwLargeBlobSupport {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Prefer key to be resident. Optional parameter, defaulting to **FALSE**. When **TRUE**, overrides **bRequireResidentKey**.
     * @type {Integer}
     */
    bPreferResidentKey {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * Indicates whether the client is using in-private mode in the browser. An _optional_ parameter that defaults to **FALSE**.
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
}
