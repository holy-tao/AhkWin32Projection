#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class APP_CACHE_STATE{

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheStateNoUpdateNeeded => 0

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheStateUpdateNeeded => 1

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheStateUpdateNeededNew => 2

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheStateUpdateNeededMasterOnly => 3
}
