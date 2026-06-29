#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the storage media type.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-file_storage_tier_media_type
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_STORAGE_TIER_MEDIA_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeScm => 4

    /**
     * @type {Integer (Int32)}
     */
    static FileStorageTierMediaTypeMax => 5
}
