#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The <b>CachePath</b> field of the 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/winineti/ns-winineti-internet_cache_config_infoa">INTERNET_CACHE_CONFIG_INFO</a> structure 
  *          specified in the <i>lpCachedConfigInfo</i> parameter is filled with a pointer to a string 
  *          identifying the content path. This cannot be used at the same time as 
  *          <b>CACHE_CONFIG_HISTORY_PATHS_FC</b> or 
  *          <b>CACHE_CONFIG_COOKIES_PATHS_FC</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winineti/nf-winineti-geturlcacheconfiginfoa
 * @namespace Windows.Win32.Networking.WinInet
 * @version v4.0.30319
 */
class CACHE_CONFIG extends Win32Enum{

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
