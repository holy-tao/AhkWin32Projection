#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_TIMEOUT_KEY.ahk" { HTTP_SERVICE_CONFIG_TIMEOUT_KEY }

/**
 * Used to set the HTTP Server API wide timeout value.
 * @remarks
 * An instance of the <b>HTTP_SERVICE_CONFIG_TIMEOUT_SET</b> structure is used to pass data in to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HTTPSetServiceConfiguration</a> function through the <i>pConfigInformation</i> parameter or to retrieve data from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpqueryserviceconfiguration">HTTPQueryServiceConfiguration</a> function through the <i>pOutputConfigInformation</i> parameter when the <i>ConfigId</i> parameter of either function is equal to <b>HttpServiceConfigTimeout</b>.
 * 
 * Querying the existing value of an HTTP Server API wide timeout does not require administrative privileges. Setting the value, however, does require administrative privileges.
 * 
 * When the HTTP Server API wide timeout value is set with <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpsetserviceconfiguration">HTTPSetServiceConfiguration</a>, the setting persists when the HTTP service is stopped and restarted.  The timeout value is applied to all the HTTP Server API applications on the machine.
 * 
 * The HTTP Server API timeout value is deleted by calling <a href="https://docs.microsoft.com/windows/desktop/api/http/nf-http-httpdeleteserviceconfiguration">HTTPDeleteServiceConfiguration</a> with the <i>ConfigId</i> parameter set to <b>HttpServiceConfigTimeout</b> and the <i>pConfigInformation</i>  parameter pointing to the <b>HTTP_SERVICE_CONFIG_TIMEOUT_SET</b> structure. When a timer value is deleted, the persistent setting goes away, and HTTP Server API uses its hardcoded defaults.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_timeout_set
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_TIMEOUT_SET {
    #StructPack 4

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_timeout_key">HTTP_SERVICE_CONFIG_TIMEOUT_KEY</a> enumeration identifying the timer that is set.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_TIMEOUT_KEY

    /**
     * The value, in seconds, for the timer. The value must be greater than zero.
     */
    ParamDesc : UInt16

}
