#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_SNI_KEY.ahk

/**
 * Used to specify a particular Secure Sockets Layer (SSL) Server Name Indication (SNI) certificate record to query in the SSL SNI store.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_service_config_ssl_sni_query
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_SNI_QUERY extends Win32Struct
{
    static sizeof => 272

    static packingSize => 8

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
     * @type {Integer}
     */
    QueryDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>KeyDesc</i> should contain an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_sni_key">HTTP_SERVICE_CONFIG_SSL_SNI_KEY</a> structure that identifies the SSL SNI certificate record queried. If the <i>QueryDesc</i> parameter is equal to <b>HTTPServiceConfigQueryNext</b>, then <i>KeyDesc</i> is ignored.
     * @type {HTTP_SERVICE_CONFIG_SSL_SNI_KEY}
     */
    KeyDesc{
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_SNI_KEY(this.ptr + 8)
            return this.__KeyDesc
        }
    }

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HTTPServiceConfigQueryNext</b>, then <i>dwToken</i> must be equal to zero on the first call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> function, one on the second call, two on the third call, and so forth until all SSL certificate records are returned, at which point 
     * <b>HttpQueryServiceConfiguration</b> returns ERROR_NO_MORE_ITEMS. 
     * 
     * 
     * 
     * 
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>dwToken</i> is ignored.
     * @type {Integer}
     */
    dwToken {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }
}
