#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_CACHE_POLICY_TYPE.ahk" { HTTP_CACHE_POLICY_TYPE }

/**
 * Used to define a cache policy associated with a cached response fragment.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_cache_policy
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_CACHE_POLICY {
    #StructPack 4

    Policy : HTTP_CACHE_POLICY_TYPE

    /**
     * When the <b>Policy</b> member is equal to HttpCachePolicyTimeToLive, data is cached for <b>SecondsToLive</b> seconds before it is released. For other values of <b>Policy</b>, <b>SecondsToLive</b> is ignored.
     */
    SecondsToLive : UInt32

}
