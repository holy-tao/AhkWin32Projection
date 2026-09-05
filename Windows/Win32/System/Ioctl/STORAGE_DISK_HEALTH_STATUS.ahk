#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_DISK_HEALTH_STATUS extends Win32Enum {

    /**
     * Native name: DiskHealthUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DiskHealthUnhealthy
     * @type {Integer (Int32)}
     */
    static Unhealthy => 1

    /**
     * Native name: DiskHealthWarning
     * @type {Integer (Int32)}
     */
    static Warning => 2

    /**
     * Native name: DiskHealthHealthy
     * @type {Integer (Int32)}
     */
    static Healthy => 3

    /**
     * Native name: DiskHealthMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
