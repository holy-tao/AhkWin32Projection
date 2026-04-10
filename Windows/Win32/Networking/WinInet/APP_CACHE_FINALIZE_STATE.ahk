#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class APP_CACHE_FINALIZE_STATE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheFinalizeStateIncomplete => 0

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheFinalizeStateManifestChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static AppCacheFinalizeStateComplete => 2
}
