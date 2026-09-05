#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class PIN_CACHE_POLICY_TYPE extends Win32Enum {

    /**
     * Native name: PinCacheNormal
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * Native name: PinCacheTimed
     * @type {Integer (Int32)}
     */
    static Timed => 1

    /**
     * Native name: PinCacheNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: PinCacheAlwaysPrompt
     * @type {Integer (Int32)}
     */
    static AlwaysPrompt => 3
}
