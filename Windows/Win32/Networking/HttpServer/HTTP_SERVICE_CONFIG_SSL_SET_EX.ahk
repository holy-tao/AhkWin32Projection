#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_KEY_EX.ahk
#Include .\HTTP2_WINDOW_SIZE_PARAM.ahk
#Include .\HTTP2_SETTINGS_LIMITS_PARAM.ahk
#Include .\HTTP_PERFORMANCE_PARAM.ahk
#Include .\HTTP_TLS_RESTRICTIONS_PARAM.ahk
#Include .\HTTP_ERROR_HEADERS_PARAM.ahk
#Include .\HTTP_TLS_SESSION_TICKET_KEYS_PARAM.ahk
#Include .\HTTP_CERT_CONFIG_PARAM.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_PARAM_EX.ahk

/**
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_SET_EX extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * @type {HTTP_SERVICE_CONFIG_SSL_KEY_EX}
     */
    KeyDesc{
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_KEY_EX(this.ptr + 0)
            return this.__KeyDesc
        }
    }

    /**
     * @type {HTTP_SERVICE_CONFIG_SSL_PARAM_EX}
     */
    ParamDesc{
        get {
            if(!this.HasProp("__ParamDesc"))
                this.__ParamDesc := HTTP_SERVICE_CONFIG_SSL_PARAM_EX(this.ptr + 248)
            return this.__ParamDesc
        }
    }
}
