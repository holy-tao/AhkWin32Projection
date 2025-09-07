#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_TIER_MEDIA_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierMediaTypeUnspecified => 0

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierMediaTypeDisk => 1

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierMediaTypeSsd => 2

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierMediaTypeScm => 4

    /**
     * @type {Integer (Int32)}
     */
    static StorageTierMediaTypeMax => 5
}
