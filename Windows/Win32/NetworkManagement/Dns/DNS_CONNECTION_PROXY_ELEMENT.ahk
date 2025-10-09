#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_CONNECTION_PROXY_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_CONNECTION_PROXY_ELEMENT extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {DNS_CONNECTION_PROXY_INFO}
     */
    Info{
        get {
            if(!this.HasProp("__Info"))
                this.__Info := DNS_CONNECTION_PROXY_INFO(this.ptr + 8)
            return this.__Info
        }
    }
}
