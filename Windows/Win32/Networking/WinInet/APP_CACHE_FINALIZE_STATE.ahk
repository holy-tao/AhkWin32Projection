#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class APP_CACHE_FINALIZE_STATE extends Win32Enum {

    /**
     * Native name: AppCacheFinalizeStateIncomplete
     * @type {Integer (Int32)}
     */
    static Incomplete => 0

    /**
     * Native name: AppCacheFinalizeStateManifestChange
     * @type {Integer (Int32)}
     */
    static ManifestChange => 1

    /**
     * Native name: AppCacheFinalizeStateComplete
     * @type {Integer (Int32)}
     */
    static Complete => 2
}
