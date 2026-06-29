#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DISK_HEALTH_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthUnhealthy => 1

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthWarning => 2

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthHealthy => 3

    /**
     * @type {Integer (Int32)}
     */
    static DiskHealthMax => 4
}
