#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_GET_CREDENTIALS_OPTIONS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
     * @type {BOOL}
     */
    bBrowserInPrivateMode{
        get {
            if(!this.HasProp("__bBrowserInPrivateMode"))
                this.__bBrowserInPrivateMode := BOOL(this.ptr + 16)
            return this.__bBrowserInPrivateMode
        }
    }
}
