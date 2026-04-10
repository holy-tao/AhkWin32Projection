#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_AUTHENTICATOR_DETAILS.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_AUTHENTICATOR_DETAILS_LIST extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cAuthenticatorDetails {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Pointer<WEBAUTHN_AUTHENTICATOR_DETAILS>>}
     */
    ppAuthenticatorDetails {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
