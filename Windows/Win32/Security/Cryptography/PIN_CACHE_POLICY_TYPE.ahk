#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class PIN_CACHE_POLICY_TYPE extends Win32Enum{

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
