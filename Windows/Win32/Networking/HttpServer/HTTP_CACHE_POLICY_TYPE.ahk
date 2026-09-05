#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The HTTP_CACHE_POLICY_TYPE enumeration type defines available cache policies.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_cache_policy_type
 * @namespace Windows.Win32.Networking.HttpServer
 */
class HTTP_CACHE_POLICY_TYPE extends Win32Enum {

    /**
     * Do not cache this value at all.
     * Native name: HttpCachePolicyNocache
     * @type {Integer (Int32)}
     */
    static Nocache => 0

    /**
     * Cache this value until the user provides a different one.
     * Native name: HttpCachePolicyUserInvalidates
     * @type {Integer (Int32)}
     */
    static UserInvalidates => 1

    /**
     * Cache this value for a specified time and then remove it from the cache.
     * Native name: HttpCachePolicyTimeToLive
     * @type {Integer (Int32)}
     */
    static TimeToLive => 2

    /**
     * Terminates the enumeration; not used to determine policy.
     * Native name: HttpCachePolicyMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 3
}
