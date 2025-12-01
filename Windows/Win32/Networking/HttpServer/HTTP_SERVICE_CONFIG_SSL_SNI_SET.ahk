#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_SNI_KEY.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_PARAM.ahk

/**
 * Used to add a new Secure Sockets Layer (SSL) Server Name Indication (SNI) certificate record to the SSL SNI store or retrieve an existing record from it.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_sni_set
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_SNI_SET extends Win32Struct
{
    static sizeof => 328

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_key">HTTP_SERVICE_CONFIG_SSL_SNI_KEY</a> structure that identifies the SSL SNI certificate record.
     * @type {HTTP_SERVICE_CONFIG_SSL_SNI_KEY}
     */
    KeyDesc{
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_SNI_KEY(0, this)
            return this.__KeyDesc
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_param">HTTP_SERVICE_CONFIG_SSL_PARAM</a> structure that holds the contents of the specified SSL SNI certificate record.
     * @type {HTTP_SERVICE_CONFIG_SSL_PARAM}
     */
    ParamDesc{
        get {
            if(!this.HasProp("__ParamDesc"))
                this.__ParamDesc := HTTP_SERVICE_CONFIG_SSL_PARAM(256, this)
            return this.__ParamDesc
        }
    }
}
