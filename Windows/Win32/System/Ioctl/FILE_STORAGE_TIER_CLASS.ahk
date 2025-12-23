#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_STORAGE_TIER_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FileStorageTierClassUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static FileStorageTierClassCapacity => 1

    /**
     * @type {Integer (Int32)}
     */
    static FileStorageTierClassPerformance => 2

    /**
     * @type {Integer (Int32)}
     */
    static FileStorageTierClassMax => 3
}
