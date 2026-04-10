#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_SERVICE_CONFIG_QUERY_TYPE.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_KEY_EX.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include ..\WinSock\ADDRESS_FAMILY.ahk
#Include .\HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SERVICE_CONFIG_SSL_QUERY_EX extends Win32Struct {
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {HTTP_SERVICE_CONFIG_QUERY_TYPE}
     */
    QueryDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HTTP_SERVICE_CONFIG_SSL_KEY_EX}
     */
    KeyDesc {
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_KEY_EX(8, this)
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
     * @type {HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE}
     */
    ParamType {
        get => NumGet(this, 140, "int")
        set => NumPut("int", value, this, 140)
    }
}
