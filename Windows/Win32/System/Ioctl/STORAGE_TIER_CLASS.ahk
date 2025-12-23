#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_TIER_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassCapacity => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassPerformance => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierClassMax => 3
}
