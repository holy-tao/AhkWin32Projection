#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the write cache is enabled or disabled.
 * @remarks
 * The [IOCTL_STORAGE_QUERY_PROPERTY](ni-winioctl-ioctl_storage_query_property.md) control code reports a **WRITE_CACHE_ENABLE** value in the [STORAGE_WRITE_CACHE_PROPERTY structure](ns-winioctl-storage_write_cache_property.md).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-write_cache_enable
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WRITE_CACHE_ENABLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The system cannot report whether the device's write cache is enabled or disabled.
     * @type {Integer (Int32)}
     */
    static WriteCacheEnableUnknown => 0

    /**
     * The device's write cache is disabled.
     * @type {Integer (Int32)}
     */
    static WriteCacheDisabled => 1

    /**
     * The device's write cache is enabled.
     * @type {Integer (Int32)}
     */
    static WriteCacheEnabled => 2
}
