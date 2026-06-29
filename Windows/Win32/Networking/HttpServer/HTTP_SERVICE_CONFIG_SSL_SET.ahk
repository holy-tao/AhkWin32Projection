#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_SSL_PARAM.ahk" { HTTP_SERVICE_CONFIG_SSL_PARAM }
#Import ".\HTTP_SERVICE_CONFIG_SSL_KEY.ahk" { HTTP_SERVICE_CONFIG_SSL_KEY }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\WinSock\SOCKADDR.ahk" { SOCKADDR }

/**
 * Used to add a new record to the SSL store or retrieve an existing record from it.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_set
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_SET {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_key">HTTP_SERVICE_CONFIG_SSL_KEY</a> structure that identifies the SSL certificate record.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_SSL_KEY

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_param">HTTP_SERVICE_CONFIG_SSL_PARAM</a> structure that holds the contents of the specified SSL certificate record.
     */
    ParamDesc : HTTP_SERVICE_CONFIG_SSL_PARAM

}
