#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HTTP_CACHE_POLICY_TYPE enumeration type defines available cache policies.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_cache_policy_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_CACHE_POLICY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not cache this value at all.
     * @type {Integer (Int32)}
     */
    static HttpCachePolicyNocache => 0

    /**
     * Cache this value until the user provides a different one.
     * @type {Integer (Int32)}
     */
    static HttpCachePolicyUserInvalidates => 1

    /**
     * Cache this value for a specified time and then remove it from the cache.
     * @type {Integer (Int32)}
     */
    static HttpCachePolicyTimeToLive => 2

    /**
     * Terminates the enumeration; not used to determine policy.
     * @type {Integer (Int32)}
     */
    static HttpCachePolicyMaximum => 3
}
