#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the credential protect extension information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cred_protect_extension_in
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CRED_PROTECT_EXTENSION_IN extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * One of the **WEBAUTHN_USER_VERIFICATION** values.
     * @type {Integer}
     */
    dwCredProtect {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set the this to **TRUE** to require authenticator support for the **credProtect** extension.
     * @type {BOOL}
     */
    bRequireCredProtect {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
