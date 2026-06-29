#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_SERVICE_CONFIG_CACHE_KEY.ahk" { HTTP_SERVICE_CONFIG_CACHE_KEY }

/**
 * Used in the pConfigInformation parameter of the HttpSetServiceConfiguration function.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_service_config_cache_set
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_CACHE_SET {
    #StructPack 4

    /**
     * Cache key.
     */
    KeyDesc : HTTP_SERVICE_CONFIG_CACHE_KEY

    /**
     * Configuration cache parameter.
     */
    ParamDesc : UInt32

}
