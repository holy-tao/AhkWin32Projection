#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * A structure containing the client data that is sent to the authenticator.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_client_data
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_CLIENT_DATA extends Win32Struct
{
    static sizeof => 24

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
     * The size of the **pbClientDataJSON** field.
     * @type {Integer}
     */
    cbClientDataJSON {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * UTF-8 encoded JSON serialization of the client data.
     * @type {Pointer<Byte>}
     */
    pbClientDataJSON {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Hash algorithm ID used to hash the **pbClientDataJSON** field.
     * @type {PWSTR}
     */
    pwszHashAlgId{
        get {
            if(!this.HasProp("__pwszHashAlgId"))
                this.__pwszHashAlgId := PWSTR(this.ptr + 16)
            return this.__pwszHashAlgId
        }
    }
}
