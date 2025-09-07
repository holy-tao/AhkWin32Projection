#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in the pConfigInformation parameter of the HttpSetServiceConfiguration function.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_cache_set
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_CACHE_SET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Cache key.
     * @type {Integer}
     */
    KeyDesc {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Configuration cache parameter.
     * @type {Integer}
     */
    ParamDesc {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
