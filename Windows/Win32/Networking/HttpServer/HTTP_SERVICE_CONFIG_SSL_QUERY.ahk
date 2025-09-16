#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to specify a particular record to query in the SSL configuration store.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_ssl_query
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_QUERY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * One of the  following values from the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_query_type">HTTP_SERVICE_CONFIG_QUERY_TYPE</a> enumeration.
     * @type {Integer}
     */
    QueryDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the <i>QueryDesc</i> parameter is equal to <b>HttpServiceConfigQueryExact</b>, then <i>KeyDesc</i> should contain an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_key">HTTP_SERVICE_CONFIG_SSL_KEY</a> structure that identifies the SSL certificate record queried. If the <i>QueryDesc</i> parameter is equal to HTTPServiceConfigQueryNext, then <i>KeyDesc</i> is ignored.
     * @type {Pointer<HTTP_SERVICE_CONFIG_SSL_KEY>}
     */
    KeyDesc {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
