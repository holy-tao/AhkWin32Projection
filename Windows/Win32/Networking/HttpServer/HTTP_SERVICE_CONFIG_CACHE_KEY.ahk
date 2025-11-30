#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used in the HttpSetServiceConfiguration and HttpQueryServiceConfiguration functions.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_service_config_cache_key
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_SERVICE_CONFIG_CACHE_KEY extends Win32Enum{

    /**
     * The maximum cache size for the response.
     * @type {Integer (Int32)}
     */
    static MaxCacheResponseSize => 0

    /**
     * The chunk size.
     * @type {Integer (Int32)}
     */
    static CacheRangeChunkSize => 1
}
