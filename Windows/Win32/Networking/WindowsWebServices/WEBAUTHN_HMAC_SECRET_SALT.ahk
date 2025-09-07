#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the SALT values for the Hmac-Secret.
 * @remarks
 * SALT values, by default, are converted into RAW Hmac-Secret values as per PRF extension.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_hmac_secret_salt
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_HMAC_SECRET_SALT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of pbFirst.
     * @type {Integer}
     */
    cbFirst {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The first SALT value.
     * @type {Pointer<Byte>}
     */
    pbFirst {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * THe size of pbSecond.
     * @type {Integer}
     */
    cbSecond {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The second SALT value.
     * @type {Pointer<Byte>}
     */
    pbSecond {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
