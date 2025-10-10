#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk
#Include .\HTTP_SERVICE_CONFIG_SSL_CCS_KEY.ahk

/**
 * Specifies a Secure Sockets Layer (SSL) configuration to query for an SSL Centralized Certificate Store (CCS) record on the port when you call the HttpQueryServiceConfiguration function.
 * @remarks
 * 
  * Pass this structure to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> function by using the <i>pInputConfigInfo</i> parameter when the <i>ConfigId</i> parameter is set to <b>HttpServiceConfigSslCcsCertInfo</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_service_config_ssl_ccs_query
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_CCS_QUERY extends Win32Struct
{
    static sizeof => 264

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    QueryDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_key">HTTP_SERVICE_CONFIG_SSL_CCS_KEY</a> structure that identifies the SSL CCS certificate record queried,  if the <b>QueryDesc</b> member is equal to <b>HttpServiceConfigQueryExact</b>. Ignored if <b>QueryDesc</b>  is equal to <b>HTTPServiceConfigQueryNext</b>.
     * @type {HTTP_SERVICE_CONFIG_SSL_CCS_KEY}
     */
    KeyDesc{
        get {
            if(!this.HasProp("__KeyDesc"))
                this.__KeyDesc := HTTP_SERVICE_CONFIG_SSL_CCS_KEY(this.ptr + 8)
            return this.__KeyDesc
        }
    }

    /**
     * The position of the record in the sequence of records that this call to <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> should retrieve if the <b>QueryDesc</b> method equals <b>HTTPServiceConfigQueryNext</b>, starting from zero.  In other words,  <b>dwToken</b> must be equal to zero on the first call to the <b>HttpQueryServiceConfiguration</b> function, one on the second call, two on the third call, and so forth. When the sequence of calls has returned  all SSL certificate records,  <b>HttpQueryServiceConfiguration</b> returns <b>ERROR_NO_MORE_ITEMS</b>.
     * Ignored if the <b>QueryDesc</b> is equal to <b>HttpServiceConfigQueryExact</b>.
     * @type {Integer}
     */
    dwToken {
        get => NumGet(this, 256, "uint")
        set => NumPut("uint", value, this, 256)
    }
}
