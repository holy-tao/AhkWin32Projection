#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the storage media type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-file_storage_tier_media_type
 * @namespace Windows.Win32.System.Ioctl
 */
class FILE_STORAGE_TIER_MEDIA_TYPE extends Win32Enum {

    /**
     * Media type is unspecified.
     * Native name: FileStorageTierMediaTypeUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * Media type is an HDD (hard disk drive).
     * Native name: FileStorageTierMediaTypeDisk
     * @type {Integer (Int32)}
     */
    static Disk => 1

    /**
     * Media type is an SSD (solid state drive).
     * Native name: FileStorageTierMediaTypeSsd
     * @type {Integer (Int32)}
     */
    static Ssd => 2

    /**
     * Native name: FileStorageTierMediaTypeScm
     * @type {Integer (Int32)}
     */
    static Scm => 4

    /**
     * Native name: FileStorageTierMediaTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
