#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in the HttpSetServiceConfiguration and HttpQueryServiceConfiguration functions.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_service_config_cache_key
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_SERVICE_CONFIG_CACHE_KEY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
