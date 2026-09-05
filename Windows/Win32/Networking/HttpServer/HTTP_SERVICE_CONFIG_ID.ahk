#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines service configuration options.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_config_id
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_SERVICE_CONFIG_ID extends Win32Enum {

    /**
     * Specifies the IP Listen List used to register IP addresses on which to listen for SSL connections.
     * Native name: HttpServiceConfigIPListenList
     * @type {Integer (Int32)}
     */
    static ConfigIPListenList => 0

    /**
     * Specifies the SSL certificate store.
     * 
     * <div class="alert"><b>Note</b>  If SSL is enabled in the HTTP Server API, TLS 1.0 may be used in place of SSL when the client application specifies TLS.</div>
     * <div> </div>
     * Native name: HttpServiceConfigSSLCertInfo
     * @type {Integer (Int32)}
     */
    static ConfigSSLCertInfo => 1

    /**
     * Specifies the URL reservation store.
     * Native name: HttpServiceConfigUrlAclInfo
     * @type {Integer (Int32)}
     */
    static UrlAclInfo => 2

    /**
     * Configures the HTTP Server API wide connection timeouts.
     * 
     * 
     * <div class="alert"><b>Note</b>  Windows Vista and later versions of Windows</div>
     * <div> </div>
     * Native name: HttpServiceConfigTimeout
     * @type {Integer (Int32)}
     */
    static Timeout => 3

    /**
     * Used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a> and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a> functions.
     * 
     * <div class="alert"><b>Note</b>  Windows Server 2008 R2 and Windows 7 and later versions of Windows.</div>
     * <div> </div>
     * Native name: HttpServiceConfigCache
     * @type {Integer (Int32)}
     */
    static Cache => 4

    /**
     * Specifies the SSL endpoint configuration with <i>Hostname:Port</i> as key. Used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HttpDeleteServiceConfiguration</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpupdateserviceconfiguration">HttpUpdateServiceConfiguration</a> functions
     * 
     * <div class="alert"><b>Note</b>  Windows 8 and later versions of Windows.</div>
     * <div> </div>
     * Native name: HttpServiceConfigSslSniCertInfo
     * @type {Integer (Int32)}
     */
    static SslSniCertInfo => 5

    /**
     * Specifies that an operation should be performed for the   SSL certificate record that specifies that Http.sys should consult the Centralized Certificate Store (CCS) store to find certificates if the port receives a Transport Layer Security (TLS) handshake.  Used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HttpDeleteServiceConfiguration</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HttpQueryServiceConfiguration</a>, <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HttpSetServiceConfiguration</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpupdateserviceconfiguration">HttpUpdateServiceConfiguration</a> functions
     * 
     * <div class="alert"><b>Note</b>  Windows 8 and later versions of Windows.</div>
     * <div> </div>
     * Native name: HttpServiceConfigSslCcsCertInfo
     * @type {Integer (Int32)}
     */
    static SslCcsCertInfo => 6

    /**
     * Native name: HttpServiceConfigSetting
     * @type {Integer (Int32)}
     */
    static Setting => 7

    /**
     * Native name: HttpServiceConfigSslCertInfoEx
     * @type {Integer (Int32)}
     */
    static SslCertInfoEx => 8

    /**
     * Native name: HttpServiceConfigSslSniCertInfoEx
     * @type {Integer (Int32)}
     */
    static SslSniCertInfoEx => 9

    /**
     * Native name: HttpServiceConfigSslCcsCertInfoEx
     * @type {Integer (Int32)}
     */
    static SslCcsCertInfoEx => 10

    /**
     * Native name: HttpServiceConfigSslScopedCcsCertInfo
     * @type {Integer (Int32)}
     */
    static SslScopedCcsCertInfo => 11

    /**
     * Native name: HttpServiceConfigSslScopedCcsCertInfoEx
     * @type {Integer (Int32)}
     */
    static SslScopedCcsCertInfoEx => 12

    /**
     * Terminates the enumeration; is not used to define a service configuration option.
     * Native name: HttpServiceConfigMax
     * @type {Integer (Int32)}
     */
    static Max => 13
}
