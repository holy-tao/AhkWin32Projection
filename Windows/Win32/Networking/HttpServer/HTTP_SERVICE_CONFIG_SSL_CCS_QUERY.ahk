#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_QUERY_TYPE.ahk" { HTTP_SERVICE_CONFIG_QUERY_TYPE }
#Import ".\HTTP_SERVICE_CONFIG_SSL_CCS_KEY.ahk" { HTTP_SERVICE_CONFIG_SSL_CCS_KEY }
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Specifies a Secure Sockets Layer (SSL) configuration to query for an SSL Centralized Certificate Store (CCS) record on the port when you call the HttpQueryServiceConfiguration function.
 * @remarks
 * Pass this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> function by using the <i>pInputConfigInfo</i> parameter when the <i>ConfigId</i> parameter is set to <b>HttpServiceConfigSslCcsCertInfo</b>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_ccs_query
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_CCS_QUERY {
    #StructPack 8

    QueryDesc : HTTP_SERVICE_CONFIG_QUERY_TYPE

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_key">HTTP_SERVICE_CONFIG_SSL_CCS_KEY</a> structure that identifies the SSL CCS certificate record queried,  if the <b>QueryDesc</b> member is equal to <b>HttpServiceConfigQueryExact</b>. Ignored if <b>QueryDesc</b>  is equal to <b>HTTPServiceConfigQueryNext</b>.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_SSL_CCS_KEY

    /**
     * The position of the record in the sequence of records that this call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> should retrieve if the <b>QueryDesc</b> method equals <b>HTTPServiceConfigQueryNext</b>, starting from zero.  In other words,  <b>dwToken</b> must be equal to zero on the first call to the <b>HttpQueryServiceConfiguration</b> function, one on the second call, two on the third call, and so forth. When the sequence of calls has returned  all SSL certificate records,  <b>HttpQueryServiceConfiguration</b> returns <b>ERROR_NO_MORE_ITEMS</b>.
     * Ignored if the <b>QueryDesc</b> is equal to <b>HttpServiceConfigQueryExact</b>.
     */
    dwToken : UInt32

}
