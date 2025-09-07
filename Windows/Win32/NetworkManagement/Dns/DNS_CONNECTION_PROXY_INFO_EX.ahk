#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DNS_CONNECTION_PROXY_INFO.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_PROXY_INFO_EX extends Win32Struct
{
    static sizeof => 80

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
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {PWSTR}
     */
    pwszConnectionName{
        get {
            if(!this.HasProp("__pwszConnectionName"))
                this.__pwszConnectionName := PWSTR(this.ptr + 56)
            return this.__pwszConnectionName
        }
    }

    /**
     * @type {Integer}
     */
    fDirectConfiguration {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(this.ptr + 72)
            return this.__hConnection
        }
    }
}
