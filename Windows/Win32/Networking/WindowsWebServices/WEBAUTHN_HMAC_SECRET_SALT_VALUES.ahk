#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the SALT values for the HMAC secret.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_hmac_secret_salt_values
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_HMAC_SECRET_SALT_VALUES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The global HMAC SALT.
     * @type {Pointer<WEBAUTHN_HMAC_SECRET_SALT>}
     */
    pGlobalHmacSalt {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of **pCredWithHmacSecretSaltList**.
     * @type {Integer}
     */
    cCredWithHmacSecretSaltList {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The list of credentials with HMAC secret SALT.
     * @type {Pointer<WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT>}
     */
    pCredWithHmacSecretSaltList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
