#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the cache type.
 * @remarks
 * There are two main types of write cache: *write back* and *write through*. With a write-back cache, the device does not copy cache data to nonvolatile media until absolutely necessary. This type of operation improves the performance of write operations. With a write-through cache, the device writes data to the cache and the media in parallel. This type of operation does not improve write performance, but it makes subsequent read operations faster.
 * 
 * The [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) control code reports a **WRITE_CACHE_TYPE** value in the [STORAGE_WRITE_CACHE_PROPERTY](ns-winioctl-storage_write_cache_property.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-write_cache_type
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WRITE_CACHE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The system cannot report the type of the write cache.
     * @type {Integer (Int32)}
     */
    static WriteCacheTypeUnknown => 0

    /**
     * The device does not have a write cache.
     * @type {Integer (Int32)}
     */
    static WriteCacheTypeNone => 1

    /**
     * The device has a write-back cache.
     * @type {Integer (Int32)}
     */
    static WriteCacheTypeWriteBack => 2

    /**
     * The device has a write-through cache.
     * @type {Integer (Int32)}
     */
    static WriteCacheTypeWriteThrough => 3
}
