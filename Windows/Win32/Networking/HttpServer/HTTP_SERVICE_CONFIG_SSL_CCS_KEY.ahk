#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\WinSock\SOCKADDR_STORAGE.ahk

/**
 * Serves as the key by which identifies the SSL certificate record that specifies that Http.sys should consult the Centralized Certificate Store (CCS) store to find certificates if the port receives a Transport Layer Security (TLS) handshake.
 * @remarks
 * 
  *  The <b>HTTP_SERVICE_CONFIG_SSL_CCS_KEY</b> structure appears in the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_set">HTTP_SERVICE_CONFIG_SSL_CCS_SET</a> and the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_ssl_ccs_query">HTTP_SERVICE_CONFIG_SSL_CCS_QUERY</a> structures. <b>HTTP_SERVICE_CONFIG_SSL_CCS_KEY</b> is passed as part of these structures in the <i>pConfigInformation</i>, <i>ConfigInfo</i>, <i>pInputConfigInfo</i>, and <i>pOutputConfigInfo</i> parameters to the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HttpDeleteServiceConfiguration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpupdateserviceconfiguration">HttpUpdateServiceConfiguration</a> functions when the <i>ConfigId</i> parameter is set to <b>HttpServiceConfigSslCcsCertInfo</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_service_config_ssl_ccs_key
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_SSL_CCS_KEY extends Win32Struct
{
    static sizeof => 248

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms740504(v=vs.85)">SOCKADDR_STORAGE</a> structure that contains the Internet Protocol version 4 (IPv4) address with which this SSL certificate record is associated. It must be set to the IPv4 wildcard address of type <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-sockaddr_in">SOCKADDR_IN</a> with the <b>sin_family</b> member set to AF_INET and the <b>sin_addr</b> member filled with zeros (0.0.0.0). The <b>sin_port</b> member can be any valid port.
     * @type {SOCKADDR_STORAGE}
     */
    LocalAddress{
        get {
            if(!this.HasProp("__LocalAddress"))
                this.__LocalAddress := SOCKADDR_STORAGE(0, this)
            return this.__LocalAddress
        }
    }
}
