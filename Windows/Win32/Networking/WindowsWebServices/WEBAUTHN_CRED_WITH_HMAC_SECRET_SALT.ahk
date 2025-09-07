#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The structure containing the credential with SALT values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cred_with_hmac_secret_salt
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CRED_WITH_HMAC_SECRET_SALT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size of **pbCredID**.
     * @type {Integer}
     */
    cbCredID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The credential Id.
     * @type {Pointer<Byte>}
     */
    pbCredID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * PRF Values for the credential.
     * @type {Pointer<WEBAUTHN_HMAC_SECRET_SALT>}
     */
    pHmacSecretSalt {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
