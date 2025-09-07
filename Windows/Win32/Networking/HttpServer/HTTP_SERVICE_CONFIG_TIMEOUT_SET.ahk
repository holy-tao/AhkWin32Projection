#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_TIMEOUT_SET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_service_config_timeout_key">HTTP_SERVICE_CONFIG_TIMEOUT_KEY</a> enumeration identifying the timer that is set.
     * @type {Integer}
     */
    KeyDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The value, in seconds, for the timer. The value must be greater than zero.
     * @type {Integer}
     */
    ParamDesc {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }
}
