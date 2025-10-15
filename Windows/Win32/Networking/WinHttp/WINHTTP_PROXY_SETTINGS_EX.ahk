#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS_EX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ullGenerationId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pcwszAutoconfigUrl{
        get {
            if(!this.HasProp("__pcwszAutoconfigUrl"))
                this.__pcwszAutoconfigUrl := PWSTR(this.ptr + 16)
            return this.__pcwszAutoconfigUrl
        }
    }

    /**
     * @type {PWSTR}
     */
    pcwszProxy{
        get {
            if(!this.HasProp("__pcwszProxy"))
                this.__pcwszProxy := PWSTR(this.ptr + 24)
            return this.__pcwszProxy
        }
    }

    /**
     * @type {PWSTR}
     */
    pcwszSecureProxy{
        get {
            if(!this.HasProp("__pcwszSecureProxy"))
                this.__pcwszSecureProxy := PWSTR(this.ptr + 32)
            return this.__pcwszSecureProxy
        }
    }

    /**
     * @type {Integer}
     */
    cProxyBypasses {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    rgpcwszProxyBypasses {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwInterfaceIndex {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {PWSTR}
     */
    pcwszConnectionName{
        get {
            if(!this.HasProp("__pcwszConnectionName"))
                this.__pcwszConnectionName := PWSTR(this.ptr + 64)
            return this.__pcwszConnectionName
        }
    }
}
