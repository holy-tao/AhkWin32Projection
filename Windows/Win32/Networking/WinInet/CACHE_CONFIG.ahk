#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct CACHE_CONFIG {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_FORCE_CLEANUP_FC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_DISK_CACHE_PATHS_FC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_SYNC_MODE_FC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_CONTENT_PATHS_FC => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_HISTORY_PATHS_FC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_COOKIES_PATHS_FC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_QUOTA_FC => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_USER_MODE_FC => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_CONTENT_USAGE_FC => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_CONFIG_STICKY_CONTENT_USAGE_FC => 16384
}
