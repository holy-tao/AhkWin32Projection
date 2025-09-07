#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_CACHE_RETENTION_PRIORITY{

    /**
     * @type {Integer (Int32)}
     */
    static EqualPriority => 0

    /**
     * @type {Integer (Int32)}
     */
    static KeepPrefetchedData => 1

    /**
     * @type {Integer (Int32)}
     */
    static KeepReadData => 2
}
