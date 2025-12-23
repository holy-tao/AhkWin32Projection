#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIALS.ahk
#Include .\WEBAUTHN_EXTENSIONS.ahk

/**
 * A structure that contains the options to get an assertion.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_authenticator_get_assertion_options
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_AUTHENTICATOR_GET_ASSERTION_OPTIONS extends Win32Struct
{
    static sizeof => 160

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
     * Time that the operation is expected to complete within. This is used as guidance and can be overridden by the platform.
     * @type {Integer}
     */
    dwTimeoutMilliseconds {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The list of allowed credentials to be used in the assertion.
     * @type {WEBAUTHN_CREDENTIALS}
     */
    CredentialList{
        get {
            if(!this.HasProp("__CredentialList"))
                this.__CredentialList := WEBAUTHN_CREDENTIALS(8, this)
            return this.__CredentialList
        }
    }

    /**
     * A CBOR map from extension identifiers to their authenticator extension inputs, created by the client based on the extensions requested by the Relying Party. These are _optional_ extensions to parse when performing the operation.
     * @type {WEBAUTHN_EXTENSIONS}
     */
    Extensions{
        get {
            if(!this.HasProp("__Extensions"))
                this.__Extensions := WEBAUTHN_EXTENSIONS(24, this)
            return this.__Extensions
        }
    }

    /**
     * The attachment for the assertion. _Optional_ platform vs cross-platform authenticators.
     * @type {Integer}
     */
    dwAuthenticatorAttachment {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The effective user verification requirement.
     * @type {Integer}
     */
    dwUserVerificationRequirement {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The flags for the assertion.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * _Optional_ identifier for the U2F AppId. Converted to UTF8 before being hashed. Not lower-cased.
     * @type {PWSTR}
     */
    pwszU2fAppId {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * If this is non-NULL, then, set to **TRUE** if the **pwszU2fAppid** was used instead of **PCWSTR pwszRpId**.
     * @type {Pointer<BOOL>}
     */
    pbU2fAppId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * _Optional_ cancellation Id. See [WebAuthNGetCancellationId](./nf-webauthn-webauthngetcancellationid.md) for more information.
     * @type {Pointer<Guid>}
     */
    pCancellationId {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * An _optional_ list of public key credential descriptors describing credentials acceptable to the Relying Party (possibly filtered by the client), if any. If present, **CredentialList** will be ignored.
     * @type {Pointer<WEBAUTHN_CREDENTIAL_LIST>}
     */
    pAllowCredentialList {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The large blob operation.
     * @type {Integer}
     */
    dwCredLargeBlobOperation {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Size of **pbCredLargeBlob**.
     * @type {Integer}
     */
    cbCredLargeBlob {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * A pointer to the large credential blob.
     * @type {Pointer<Integer>}
     */
    pbCredLargeBlob {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * PRF values which will be converted into HMAC-SECRET values according to the WebAuthN Spec.
     * @type {Pointer<WEBAUTHN_HMAC_SECRET_SALT_VALUES>}
     */
    pHmacSecretSaltValues {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Indicates whether the client is using in-private mode in the browser. An _optional_ parameter that defaults to **FALSE**.
     * @type {BOOL}
     */
    bBrowserInPrivateMode {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * @type {Pointer<CTAPCBOR_HYBRID_STORAGE_LINKED_DATA>}
     */
    pLinkedDevice {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {BOOL}
     */
    bAutoFill {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    cbJsonExt {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pbJsonExt {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    cCredentialHints {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    ppwszCredentialHints {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }
}
