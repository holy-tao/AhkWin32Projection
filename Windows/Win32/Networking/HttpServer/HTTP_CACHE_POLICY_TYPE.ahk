#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HTTP_CACHE_POLICY_TYPE enumeration type defines available cache policies.
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_cache_policy_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_CACHE_POLICY_TYPE extends Win32Enum{

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
