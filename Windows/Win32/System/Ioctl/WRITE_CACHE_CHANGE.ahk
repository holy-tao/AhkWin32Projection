#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether the write cache features of a device are changeable.
 * @remarks
 * 
  * The [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) request returns a **WRITE_CACHE_CHANGE** value in the [STORAGE_WRITE_CACHE_PROPERTY](ns-winioctl-storage_write_cache_property.md) structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ne-winioctl-write_cache_change
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class WRITE_CACHE_CHANGE{

    /**
     * The system cannot report the write cache change capability of the device.
     * @type {Integer (Int32)}
     */
    static WriteCacheChangeUnknown => 0

    /**
     * Host software cannot change the characteristics of the device's write cache.
     * @type {Integer (Int32)}
     */
    static WriteCacheNotChangeable => 1

    /**
     * Host software can change the characteristics of the device's write cache.
     * @type {Integer (Int32)}
     */
    static WriteCacheChangeable => 2
}
