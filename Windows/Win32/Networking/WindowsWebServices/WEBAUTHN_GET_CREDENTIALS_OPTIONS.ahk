#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains the options for the WebAuthNGetPlatformCredentialsList function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_get_credentials_options
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_GET_CREDENTIALS_OPTIONS extends Win32Struct
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
     * The Id of the relying party that is making the request. This field is _optional_.
     * @type {PWSTR}
     */
    pwszRpId{
        get {
            if(!this.HasProp("__pwszRpId"))
                this.__pwszRpId := PWSTR(this.ptr + 8)
            return this.__pwszRpId
        }
    }

    /**
     * Is browser in-private mode. This field is _optional_ and defaults to **FALSE**.
     * @type {Integer}
     */
    bBrowserInPrivateMode {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
