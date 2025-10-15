#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class EXPERIMENTAL_WEBAUTHN_PLUGIN_UPDATE_AUTHENTICATOR_DETAILS extends Win32Struct
{
    static sizeof => 104

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
    pwszNewPluginClsId{
        get {
            if(!this.HasProp("__pwszNewPluginClsId"))
                this.__pwszNewPluginClsId := PWSTR(this.ptr + 16)
            return this.__pwszNewPluginClsId
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
    cbPluginIdKey {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbPluginIdKey {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    cbAuthenticatorInfo {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbAuthenticatorInfo {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    cbNonce {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbNonce {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    cbSignature {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer<Byte>}
     */
    pbSignature {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
