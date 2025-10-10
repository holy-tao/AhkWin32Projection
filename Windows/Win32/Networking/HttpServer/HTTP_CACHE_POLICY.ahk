#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to define a cache policy associated with a cached response fragment.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_cache_policy
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_CACHE_POLICY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Policy {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * When the <b>Policy</b> member is equal to HttpCachePolicyTimeToLive, data is cached for <b>SecondsToLive</b> seconds before it is released. For other values of <b>Policy</b>, <b>SecondsToLive</b> is ignored.
     * @type {Integer}
     */
    SecondsToLive {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
