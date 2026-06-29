#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_SSL_CCS_KEY.ahk" { HTTP_SERVICE_CONFIG_SSL_CCS_KEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_SSL_PARAM.ahk" { HTTP_SERVICE_CONFIG_SSL_PARAM }
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Represents the SSL certificate record that specifies that Http.sys should consult the Centralized Certificate Store (CCS) store to find certificates if the port receives a Transport Layer Security (TLS) handshake.
 * @remarks
 * Pass this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> or <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HttpDeleteServiceConfiguration</a> function through the <i>pConfigInformation</i> parameter to add or remove an SSL certificate record. Pass this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpupdateserviceconfiguration">HttpUpdateServiceConfiguration</a> function through the <i>ConfigInfo</i> parameter to update an SSL certificate record.  Use  the <i>pOutputConfigInfo</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> function to retrieve SSL certificate record data in this structure. For all of these operations, set the <i>ConfigId</i> parameter of these functions to <b>HttpServiceConfigSslCcsCertInfo</b>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_ccs_set
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_CCS_SET {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_key">HTTP_SERVICE_CONFIG_SSL_CCS_KEY</a> structure that identifies the SSL CCS certificate record.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_SSL_CCS_KEY

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_param">HTTP_SERVICE_CONFIG_SSL_PARAM</a> structure that holds the contents of the specified SSL CCS certificate record.
     */
    ParamDesc : HTTP_SERVICE_CONFIG_SSL_PARAM

}
