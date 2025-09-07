#Requires AutoHotkey v2.0.0 64-bit

/**
 * The HTTP_SERVICE_CONFIG_TIMEOUT_KEY enumeration defines the type of timer that is queried or configured through the HTTP_SERVICE_CONFIG_TIMEOUT_SET structure.
 * @remarks
 * The <b>HTTP_SERVICE_CONFIG_TIMEOUT_KEY</b> enumeration is used in the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_service_config_timeout_set">HTTP_SERVICE_CONFIG_TIMEOUT_SET</a> structure to define the type of timer that is configured. The <b>HTTP_SERVICE_CONFIG_TIMEOUT_SET</b> structure passes data to  the <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HTTPSetServiceConfiguration</a> function through  the <i>pConfigInformation</i> parameter or retrieves data from the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HTTPQueryServiceConfiguration</a> function through the <i>pOutputConfigInformation</i> parameter when the <i>ConfigId</i> parameter of either function is equal to <b>HttpServiceConfigTimeout</b>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_config_timeout_key
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_TIMEOUT_KEY{

    /**
     * The maximum time allowed for a connection to remain idle, after which, the connection is timed out and reset.
     * @type {Integer (Int32)}
     */
    static IdleConnectionTimeout => 0

    /**
     * The maximum time allowed to parse all the request headers, including the request line, after which, the connection is timed out and reset.
     * @type {Integer (Int32)}
     */
    static HeaderWaitTimeout => 1
}
