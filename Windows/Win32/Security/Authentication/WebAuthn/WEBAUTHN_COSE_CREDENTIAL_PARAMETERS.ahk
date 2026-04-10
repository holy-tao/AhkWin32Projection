#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\WEBAUTHN_COSE_CREDENTIAL_PARAMETER.ahk

/**
 * The structure containing the COSE parameters for a credential.
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_cose_credential_parameters
 * @namespace Windows.Win32.Security.Authentication.WebAuthn
 */
class WEBAUTHN_COSE_CREDENTIAL_PARAMETERS extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * The COSE parameters for the credential.
     * @type {Integer}
     */
    cCredentialParameters {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the COSE parameters for the credential.
     * @type {Pointer<WEBAUTHN_COSE_CREDENTIAL_PARAMETER>}
     */
    pCredentialParameters {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
