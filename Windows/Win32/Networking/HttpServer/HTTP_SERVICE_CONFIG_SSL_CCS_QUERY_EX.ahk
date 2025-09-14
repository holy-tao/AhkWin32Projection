#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_CCS_KEY.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_CCS_QUERY_EX extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    QueryDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HTTP_SERVICE_CONFIG_SSL_CCS_KEY}
     */
    KeyDesc{
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_CCS_KEY(this.ptr + 8)
            return this.__KeyDesc
        }
    }

    /**
     * @type {Integer}
     */
    dwToken {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    ParamType {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }
}
