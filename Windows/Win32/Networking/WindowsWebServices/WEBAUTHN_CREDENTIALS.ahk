#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The array of credentials that the user has registered with the authenticator.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credentials
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIALS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of **pCredentials**.
     * @type {Integer}
     */
    cCredentials {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of credentials.
     * @type {Pointer<WEBAUTHN_CREDENTIAL>}
     */
    pCredentials {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
