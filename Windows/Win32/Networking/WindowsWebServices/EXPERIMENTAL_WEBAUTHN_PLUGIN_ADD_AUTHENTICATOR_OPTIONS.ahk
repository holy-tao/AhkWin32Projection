#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_PLUGIN_ADD_AUTHENTICATOR_OPTIONS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszAuthenticatorName{
        get {
            if(!this.HasProp("__pwszAuthenticatorName"))
                this.__pwszAuthenticatorName := PWSTR(this.ptr + 0)
            return this.__pwszAuthenticatorName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszPluginClsId{
        get {
            if(!this.HasProp("__pwszPluginClsId"))
                this.__pwszPluginClsId := PWSTR(this.ptr + 8)
            return this.__pwszPluginClsId
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszPluginRpId{
        get {
            if(!this.HasProp("__pwszPluginRpId"))
                this.__pwszPluginRpId := PWSTR(this.ptr + 16)
            return this.__pwszPluginRpId
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszLightThemeLogo{
        get {
            if(!this.HasProp("__pwszLightThemeLogo"))
                this.__pwszLightThemeLogo := PWSTR(this.ptr + 24)
            return this.__pwszLightThemeLogo
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszDarkThemeLogo{
        get {
            if(!this.HasProp("__pwszDarkThemeLogo"))
                this.__pwszDarkThemeLogo := PWSTR(this.ptr + 32)
            return this.__pwszDarkThemeLogo
        }
    }

    /**
     * @type {Integer}
     */
    cbAuthenticatorInfo {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbAuthenticatorInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cbPluginIdKey {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPluginIdKey {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
