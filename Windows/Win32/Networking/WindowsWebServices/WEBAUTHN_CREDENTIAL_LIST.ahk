#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The list of credentials that the user has registered with the authenticator.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_list
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIAL_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of **ppCredentials**.
     * @type {Integer}
     */
    cCredentials {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The array of credentials.
     * @type {Pointer<WEBAUTHN_CREDENTIAL_EX>}
     */
    ppCredentials {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
