#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_QUERY_TYPE.ahk" { HTTP_SERVICE_CONFIG_QUERY_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_SSL_SNI_KEY.ahk" { HTTP_SERVICE_CONFIG_SSL_SNI_KEY }
#Import "..\WinSock\SOCKADDR_STORAGE.ahk" { SOCKADDR_STORAGE }
#Import "..\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Used to specify a particular Secure Sockets Layer (SSL) Server Name Indication (SNI) certificate record to query in the SSL SNI store.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_sni_query
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_SSL_SNI_QUERY {
    #StructPack 8

    /**
     * One of the  following values from the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_query_type">HTTP_SERVICE_CONFIG_QUERY_TYPE</a> enumeration. 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigQueryExact"></a><a id="httpserviceconfigqueryexact"></a><a id="HTTPSERVICECONFIGQUERYEXACT"></a><dl>
     * <dt><b>HttpServiceConfigQueryExact</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns a single SSL SNI certificate record.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="HttpServiceConfigQueryNext"></a><a id="httpserviceconfigquerynext"></a><a id="HTTPSERVICECONFIGQUERYNEXT"></a><dl>
     * <dt><b>HttpServiceConfigQueryNext</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Returns a sequence of SSL SNI certificate records in a sequence of calls, as controlled by <i>dwToken</i>.
     * 
     * </td>
     * </tr>
     * </table>
     */
    QueryDesc : HTTP_SERVICE_CONFIG_QUERY_TYPE

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>KeyDesc</i> should contain an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_key">HTTP_SERVICE_CONFIG_SSL_SNI_KEY</a> structure that identifies the SSL SNI certificate record queried. If the <i>QueryDesc</i> parameter is equal to <b>HTTPServiceConfigQueryNext</b>, then <i>KeyDesc</i> is ignored.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_SSL_SNI_KEY

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HTTPServiceConfigQueryNext</b>, then <i>dwToken</i> must be equal to zero on the first call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> function, one on the second call, two on the third call, and so forth until all SSL certificate records are returned, at which point 
     * <b>HttpQueryServiceConfiguration</b> returns ERROR_NO_MORE_ITEMS. 
     * 
     * 
     * 
     * 
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>dwToken</i> is ignored.
     */
    dwToken : UInt32

}
