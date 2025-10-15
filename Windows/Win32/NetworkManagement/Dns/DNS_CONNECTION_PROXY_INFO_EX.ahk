#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DNS_CONNECTION_PROXY_INFO.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_PROXY_INFO_EX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {DNS_CONNECTION_PROXY_INFO}
     */
    ProxyInfo{
        get {
            if(!this.HasProp("__ProxyInfo"))
                this.__ProxyInfo := DNS_CONNECTION_PROXY_INFO(this.ptr + 0)
            return this.__ProxyInfo
        }
    }

    /**
     * @type {Integer}
     */
    dwInterfaceIndex {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {PWSTR}
     */
    pwszConnectionName{
        get {
            if(!this.HasProp("__pwszConnectionName"))
                this.__pwszConnectionName := PWSTR(this.ptr + 80)
            return this.__pwszConnectionName
        }
    }

    /**
     * @type {BOOL}
     */
    fDirectConfiguration{
        get {
            if(!this.HasProp("__fDirectConfiguration"))
                this.__fDirectConfiguration := BOOL(this.ptr + 88)
            return this.__fDirectConfiguration
        }
    }

    /**
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(this.ptr + 96)
            return this.__hConnection
        }
    }
}
