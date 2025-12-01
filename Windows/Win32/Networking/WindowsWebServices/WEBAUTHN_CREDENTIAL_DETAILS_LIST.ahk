#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The list of credentials.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_details_list
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIAL_DETAILS_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of the credential details array.
     * @type {Integer}
     */
    cCredentialDetails {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The credential details array.
     * @type {Pointer<Pointer<WEBAUTHN_CREDENTIAL_DETAILS>>}
     */
    ppCredentialDetails {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
