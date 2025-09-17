#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Data about a credential with extra information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_credential_ex
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CREDENTIAL_EX extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Version of this structure, to allow for modifications in the future. This field is required and should be set to **CURRENT_VERSION**.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of **pbID**.
     * @type {Integer}
     */
    cbId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Unique ID for this particular credential.
     * @type {Pointer<Byte>}
     */
    pbId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Well-known credential type specifying the type of this particular credential.
     * @type {Pointer<Char>}
     */
    pwszCredentialType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The transports. **0** implies no transport restrictions.
     * @type {Integer}
     */
    dwTransports {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
