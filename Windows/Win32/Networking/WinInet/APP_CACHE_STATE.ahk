#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class APP_CACHE_STATE extends Win32Enum {

    /**
     * Native name: AppCacheStateNoUpdateNeeded
     * @type {Integer (Int32)}
     */
    static NoUpdateNeeded => 0

    /**
     * Native name: AppCacheStateUpdateNeeded
     * @type {Integer (Int32)}
     */
    static UpdateNeeded => 1

    /**
     * Native name: AppCacheStateUpdateNeededNew
     * @type {Integer (Int32)}
     */
    static UpdateNeededNew => 2

    /**
     * Native name: AppCacheStateUpdateNeededMasterOnly
     * @type {Integer (Int32)}
     */
    static UpdateNeededMasterOnly => 3
}
