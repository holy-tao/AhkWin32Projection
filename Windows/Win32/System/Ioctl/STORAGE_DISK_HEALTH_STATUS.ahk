#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DISK_HEALTH_STATUS{

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthUnhealthy => 1

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthWarning => 2

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthHealthy => 3

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthMax => 4
}
