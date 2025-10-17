#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_CONNECTION_PROXY_INFO.ahk
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
                this.__ProxyInfo := DNS_CONNECTION_PROXY_INFO(0, this)
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
    pwszConnectionName {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {BOOL}
     */
    fDirectConfiguration {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {HANDLE}
     */
    hConnection{
        get {
            if(!this.HasProp("__hConnection"))
                this.__hConnection := HANDLE(96, this)
            return this.__hConnection
        }
    }
}
