#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_TIER_MEDIA_TYPE extends Win32Enum {

    /**
     * Native name: StorageTierMediaTypeUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Native name: StorageTierMediaTypeDisk
     * @type {Integer (Int32)}
     */
    static Disk => 1

    /**
     * Native name: StorageTierMediaTypeSsd
     * @type {Integer (Int32)}
     */
    static Ssd => 2

    /**
     * Native name: StorageTierMediaTypeScm
     * @type {Integer (Int32)}
     */
    static Scm => 4

    /**
     * Native name: StorageTierMediaTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
