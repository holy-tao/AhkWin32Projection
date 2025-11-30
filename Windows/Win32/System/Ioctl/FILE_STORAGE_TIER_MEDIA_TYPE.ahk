#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the storage media type.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-file_storage_tier_media_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_STORAGE_TIER_MEDIA_TYPE extends Win32Enum{

    /**
     * Media type is unspecified.
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeUnspecified => 0

    /**
     * Media type is an HDD (hard disk drive).
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeDisk => 1

    /**
     * Media type is an SSD (solid state drive).
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeSsd => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeScm => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeMax => 5
}
