#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines service configuration options.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_config_id
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_ID{

    /**
     * Specifies the IP Listen List used to register IP addresses on which to listen for SSL connections.
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigIPListenList => 0

    /**
     * Specifies the SSL certificate store.
 * 
 * <div class="alert"><b>Note</b>  If SSL is enabled in the HTTP Server API, TLS 1.0 may be used in place of SSL when the client application specifies TLS.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSSLCertInfo => 1

    /**
     * Specifies the URL reservation store.
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigUrlAclInfo => 2

    /**
     * Configures the HTTP Server API wide connection timeouts.
 * 
 * 
 * <div class="alert"><b>Note</b>  Windows Vista and later versions of Windows</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigTimeout => 3

    /**
     * Used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> functions.
 * 
 * <div class="alert"><b>Note</b>  Windows Server 2008 R2 and Windows 7 and later versions of Windows.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigCache => 4

    /**
     * Specifies the SSL endpoint configuration with <i>Hostname:Port</i> as key. Used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HttpDeleteServiceConfiguration</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpupdateserviceconfiguration">HttpUpdateServiceConfiguration</a> functions
 * 
 * <div class="alert"><b>Note</b>  Windows 8 and later versions of Windows.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslSniCertInfo => 5

    /**
     * Specifies that an operation should be performed for the   SSL certificate record that specifies that Http.sys should consult the Centralized Certificate Store (CCS) store to find certificates if the port receives a Transport Layer Security (TLS) handshake.  Used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HttpDeleteServiceConfiguration</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpupdateserviceconfiguration">HttpUpdateServiceConfiguration</a> functions
 * 
 * <div class="alert"><b>Note</b>  Windows 8 and later versions of Windows.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslCcsCertInfo => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSetting => 7

    /**
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslCertInfoEx => 8

    /**
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslSniCertInfoEx => 9

    /**
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslCcsCertInfoEx => 10

    /**
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslScopedCcsCertInfo => 11

    /**
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigSslScopedCcsCertInfoEx => 12

    /**
     * Terminates the enumeration; is not used to define a service configuration option.
     * @type {Integer (Int32)}
     */
    static HttpServiceConfigMax => 13
}
