#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_QUERY_TYPE.ahk" { HTTP_SERVICE_CONFIG_QUERY_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HTTP_SERVICE_CONFIG_URLACL_KEY.ahk" { HTTP_SERVICE_CONFIG_URLACL_KEY }

/**
 * Used to specify a particular reservation record to query in the URL namespace reservation store.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_urlacl_query
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_URLACL_QUERY {
    #StructPack 8

    QueryDesc : HTTP_SERVICE_CONFIG_QUERY_TYPE

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>KeyDesc</i> should contain an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_urlacl_key">HTTP_SERVICE_CONFIG_URLACL_KEY</a> structure that identifies the reservation record queried. 
     * 
     * 
     * 
     * 
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryNext</b>, <i>KeyDesc</i> is ignored.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_URLACL_KEY

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryNext</b>, then <i>dwToken</i> must be equal to zero on the first call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> function, one on the second call, two on the third call, and so forth until all reservation records are returned, at which point 
     * <b>HttpQueryServiceConfiguration</b> returns ERROR_NO_MORE_ITEMS. 
     * 
     * 
     * 
     * 
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>dwToken</i> is ignored.
     */
    dwToken : UInt32

}
