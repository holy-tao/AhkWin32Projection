#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS_PARAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pcwszConnectionName{
        get {
            if(!this.HasProp("__pcwszConnectionName"))
                this.__pcwszConnectionName := PWSTR(this.ptr + 8)
            return this.__pcwszConnectionName
        }
    }

    /**
     * @type {PWSTR}
     */
    pcwszProbeHost{
        get {
            if(!this.HasProp("__pcwszProbeHost"))
                this.__pcwszProbeHost := PWSTR(this.ptr + 16)
            return this.__pcwszProbeHost
        }
    }
}
