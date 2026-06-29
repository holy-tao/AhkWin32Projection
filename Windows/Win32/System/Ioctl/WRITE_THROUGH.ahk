#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a storage device supports write-through caching.
 * @remarks
 * The [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) control code reports this value in the [STORAGE_WRITE_CACHE_PROPERTY](ns-winioctl-storage_write_cache_property.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-write_through
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WRITE_THROUGH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that no information is available about the write-through capabilities of the device.
     * @type {Integer (Int32)}
     */
    static WriteThroughUnknown => 0

    /**
     * Indicates that the device does not support write-through caching.
     * @type {Integer (Int32)}
     */
    static WriteThroughNotSupported => 1

    /**
     * Indicates that the device supports write-through caching.
     * @type {Integer (Int32)}
     */
    static WriteThroughSupported => 2
}
