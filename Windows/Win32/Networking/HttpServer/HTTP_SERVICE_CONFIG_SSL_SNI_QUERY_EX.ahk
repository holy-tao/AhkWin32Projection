#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HTTP_SERVICE_CONFIG_QUERY_TYPE.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_SNI_KEY.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include ..\WinSock\ADDRESS_FAMILY.ahk
#Include .\HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SERVICE_CONFIG_SSL_SNI_QUERY_EX extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {HTTP_SERVICE_CONFIG_QUERY_TYPE}
     */
    QueryDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {HTTP_SERVICE_CONFIG_SSL_SNI_KEY}
     */
    KeyDesc {
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_SNI_KEY(8, this)
            return this.__KeyDesc
        }
    }

    /**
     * @type {Integer}
     */
    dwToken {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {HTTP_SSL_SERVICE_CONFIG_EX_PARAM_TYPE}
     */
    ParamType {
        get => NumGet(this, 148, "int")
        set => NumPut("int", value, this, 148)
    }
}
