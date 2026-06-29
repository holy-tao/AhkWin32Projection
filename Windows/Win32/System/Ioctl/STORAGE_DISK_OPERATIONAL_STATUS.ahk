#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DISK_OPERATIONAL_STATUS {
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
    static DiskOpStatusNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusUnknown => 1

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusOk => 2

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusPredictingFailure => 3

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusInService => 4

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusHardwareError => 5

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusNotUsable => 6

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusTransientError => 7

    /**
     * @type {Integer (Int32)}
     */
    static DiskOpStatusMissing => 8
}
