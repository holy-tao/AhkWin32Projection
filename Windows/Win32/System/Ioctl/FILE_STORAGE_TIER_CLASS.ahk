#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_STORAGE_TIER_CLASS extends Win32Enum {

    /**
     * Native name: FileStorageTierClassUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: FileStorageTierClassCapacity
     * @type {Integer (Int32)}
     */
    static Capacity => 1

    /**
     * Native name: FileStorageTierClassPerformance
     * @type {Integer (Int32)}
     */
    static Performance => 2

    /**
     * Native name: FileStorageTierClassMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
