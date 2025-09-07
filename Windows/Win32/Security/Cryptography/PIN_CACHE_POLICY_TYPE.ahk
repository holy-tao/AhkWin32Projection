#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PIN_CACHE_POLICY_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static PinCacheNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static PinCacheTimed => 1

    /**
     * @type {Integer (Int32)}
     */
    static PinCacheNone => 2

    /**
     * @type {Integer (Int32)}
     */
    static PinCacheAlwaysPrompt => 3
}
