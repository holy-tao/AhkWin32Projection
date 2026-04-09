#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_CREDENTIAL_EX.ahk

/**
 * The list of credentials that the user has registered with the authenticator.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_list
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_CREDENTIAL_LIST extends Win32Struct {
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
     * @type {Pointer<Pointer<WEBAUTHN_CREDENTIAL_EX>>}
     */
    ppCredentials {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
