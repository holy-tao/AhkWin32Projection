#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_SSL_PARAM.ahk" { HTTP_SERVICE_CONFIG_SSL_PARAM }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_SSL_SNI_KEY.ahk" { HTTP_SERVICE_CONFIG_SSL_SNI_KEY }
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Used to add a new Secure Sockets Layer (SSL) Server Name Indication (SNI) certificate record to the SSL SNI store or retrieve an existing record from it.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_sni_set
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_SNI_SET {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_key">HTTP_SERVICE_CONFIG_SSL_SNI_KEY</a> structure that identifies the SSL SNI certificate record.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_param">HTTP_SERVICE_CONFIG_SSL_PARAM</a> structure that holds the contents of the specified SSL SNI certificate record.
     */
    ParamDesc : HTTP_SERVICE_CONFIG_SSL_PARAM

}
