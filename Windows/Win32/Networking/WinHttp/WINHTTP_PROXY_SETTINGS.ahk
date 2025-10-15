#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwCurrentSettingsVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pwszConnectionName{
        get {
            if(!this.HasProp("__pwszConnectionName"))
                this.__pwszConnectionName := PWSTR(this.ptr + 16)
            return this.__pwszConnectionName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszProxy{
        get {
            if(!this.HasProp("__pwszProxy"))
                this.__pwszProxy := PWSTR(this.ptr + 24)
            return this.__pwszProxy
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszProxyBypass{
        get {
            if(!this.HasProp("__pwszProxyBypass"))
                this.__pwszProxyBypass := PWSTR(this.ptr + 32)
            return this.__pwszProxyBypass
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszAutoconfigUrl{
        get {
            if(!this.HasProp("__pwszAutoconfigUrl"))
                this.__pwszAutoconfigUrl := PWSTR(this.ptr + 40)
            return this.__pwszAutoconfigUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszAutoconfigSecondaryUrl{
        get {
            if(!this.HasProp("__pwszAutoconfigSecondaryUrl"))
                this.__pwszAutoconfigSecondaryUrl := PWSTR(this.ptr + 48)
            return this.__pwszAutoconfigSecondaryUrl
        }
    }

    /**
     * @type {Integer}
     */
    dwAutoDiscoveryFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    pwszLastKnownGoodAutoConfigUrl{
        get {
            if(!this.HasProp("__pwszLastKnownGoodAutoConfigUrl"))
                this.__pwszLastKnownGoodAutoConfigUrl := PWSTR(this.ptr + 64)
            return this.__pwszLastKnownGoodAutoConfigUrl
        }
    }

    /**
     * @type {Integer}
     */
    dwAutoconfigReloadDelayMins {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {FILETIME}
     */
    ftLastKnownDetectTime{
        get {
            if(!this.HasProp("__ftLastKnownDetectTime"))
                this.__ftLastKnownDetectTime := FILETIME(this.ptr + 80)
            return this.__ftLastKnownDetectTime
        }
    }

    /**
     * @type {Integer}
     */
    dwDetectedInterfaceIpCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pdwDetectedInterfaceIp {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    cNetworkKeys {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Pointer<WINHTTP_PROXY_NETWORKING_KEY>}
     */
    pNetworkKeys {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
