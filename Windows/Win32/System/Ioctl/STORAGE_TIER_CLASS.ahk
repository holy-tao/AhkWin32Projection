#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_TIER_CLASS extends Win32Enum {

    /**
     * Native name: StorageTierClassUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: StorageTierClassCapacity
     * @type {Integer (Int32)}
     */
    static Capacity => 1

    /**
     * Native name: StorageTierClassPerformance
     * @type {Integer (Int32)}
     */
    static Performance => 2

    /**
     * Native name: StorageTierClassMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
