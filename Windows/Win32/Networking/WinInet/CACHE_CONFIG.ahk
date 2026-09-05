#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class CACHE_CONFIG extends Win32Enum {

    /**
     * Native name: CACHE_CONFIG_FORCE_CLEANUP_FC
     * @type {Integer (UInt32)}
     */
    static FORCE_CLEANUP_FC => 32

    /**
     * Native name: CACHE_CONFIG_DISK_CACHE_PATHS_FC
     * @type {Integer (UInt32)}
     */
    static DISK_CACHE_PATHS_FC => 64

    /**
     * Native name: CACHE_CONFIG_SYNC_MODE_FC
     * @type {Integer (UInt32)}
     */
    static SYNC_MODE_FC => 128

    /**
     * Native name: CACHE_CONFIG_CONTENT_PATHS_FC
     * @type {Integer (UInt32)}
     */
    static CONTENT_PATHS_FC => 256

    /**
     * Native name: CACHE_CONFIG_HISTORY_PATHS_FC
     * @type {Integer (UInt32)}
     */
    static HISTORY_PATHS_FC => 1024

    /**
     * Native name: CACHE_CONFIG_COOKIES_PATHS_FC
     * @type {Integer (UInt32)}
     */
    static COOKIES_PATHS_FC => 512

    /**
     * Native name: CACHE_CONFIG_QUOTA_FC
     * @type {Integer (UInt32)}
     */
    static QUOTA_FC => 2048

    /**
     * Native name: CACHE_CONFIG_USER_MODE_FC
     * @type {Integer (UInt32)}
     */
    static USER_MODE_FC => 4096

    /**
     * Native name: CACHE_CONFIG_CONTENT_USAGE_FC
     * @type {Integer (UInt32)}
     */
    static CONTENT_USAGE_FC => 8192

    /**
     * Native name: CACHE_CONFIG_STICKY_CONTENT_USAGE_FC
     * @type {Integer (UInt32)}
     */
    static STICKY_CONTENT_USAGE_FC => 16384
}
