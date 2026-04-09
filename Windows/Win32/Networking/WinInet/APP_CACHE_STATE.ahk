#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class APP_CACHE_STATE extends Win32Enum {

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
